using Entities.Models;
using Entites.Models;
using JWTAuthenticationManager.Models;
using JwtAuthenticationManager;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace UserMicroservice.Repository
{
    public class AccountService : IAccountService
    {
        private EconnectContext _context = new EconnectContext();
        private readonly JwtTokenHandler _jwtTokenHandler;

        public AccountService(JwtTokenHandler jwtTokenHandler)
        {
            _jwtTokenHandler = jwtTokenHandler;
        }

        public AuthenticationResponse Authenticate(AuthenticationRequest authenticationRequest)
        {
            // Validate authentication request input early
            if (authenticationRequest == null || string.IsNullOrWhiteSpace(authenticationRequest.UserName) ||
                string.IsNullOrWhiteSpace(authenticationRequest.Password) ||
                string.IsNullOrWhiteSpace(authenticationRequest.ShortName))
            {
                return null;
            }
            var loginRecord = (from company in _context.Companies
                               join login in _context.Logins on company.CompanyId equals login.CompanyId
                               where company.CompanyShortName == authenticationRequest.ShortName
                                     && login.EmailAddress == authenticationRequest.UserName
                                      && login.Password == authenticationRequest.Password
                               select new
                               {
                                   company.CompanyId,
                                   company.CompanyShortName,
                                   company.CompanyFullName,
                                   login.LoginId,
                                   login.EmailAddress,
                                   login.LoginType
                                   
                               }).SingleOrDefault(); // Use SingleOrDefault to emphasize uniqueness

            if (loginRecord == null)
            {
                return null;
            }
            //string decryptedPassword = DecryptPassword(loginRecord.Password);

            //if (decryptedPassword != authenticationRequest.Password)
            //{
            //    return null; 
            //}

            // Generate JWT token for the authenticated user
            var authenticationResponse = _jwtTokenHandler.GenerateJwtToken(authenticationRequest, loginRecord.CompanyFullName, loginRecord.LoginType, loginRecord.CompanyId);
            return authenticationResponse ?? null; // Return token or null if token generation fails
        }
        
        //public string DecryptPassword(byte[] encryptedPassword)
        //{
        //    var sqlQuery = @"
        //    OPEN SYMMETRIC KEY PasswordSymmetricKey 
        //    DECRYPTION BY CERTIFICATE PasswordEncryptionCert;

        //    SELECT CONVERT(NVARCHAR(50), DECRYPTBYKEY(@EncryptedPassword)) AS DecryptedPassword;

        //    CLOSE SYMMETRIC KEY PasswordSymmetricKey;";

        //    // Use a raw SQL query to return a DTO
        //    var decryptedPasswordDto = _context.DecryptedPasswordDtos
        //        .FromSqlRaw(sqlQuery, new SqlParameter("@EncryptedPassword", encryptedPassword))
        //        .AsEnumerable() // Ensure execution before accessing the result
        //        .FirstOrDefault();

        //    return decryptedPasswordDto?.DecryptedPassword; // Return decrypted password or null
        //}


        public async Task AddUserLogin(string username, string password)
        {
            using (var context = new EconnectContext())
            {
                // Open the symmetric key in the database to encrypt the password
                var openKeySql = "OPEN SYMMETRIC KEY PasswordSymmetricKey DECRYPTION BY CERTIFICATE PasswordEncryptionCert;";
                await context.Database.ExecuteSqlRawAsync(openKeySql);

                // SQL query to insert the new login and encrypt the password in SQL
                var sqlInsert = @"
                INSERT INTO [dbo].[Login] 
                    (CompanyId, [Login], [Password], EmailAddress, IsActive) 
                VALUES 
                (@CompanyId, @Username, ENCRYPTBYKEY(KEY_GUID('PasswordSymmetricKey'), @Password), @EmailAddress, 1);";

                var parameters = new[]
                {
                    new SqlParameter("@CompanyId", 1),
                    new SqlParameter("@Username", username),
                    new SqlParameter("@Password", password), // Plain text password
                    new SqlParameter("@EmailAddress", "user@example.com")
                };

                // Execute the SQL query with encrypted password
                await context.Database.ExecuteSqlRawAsync(sqlInsert, parameters);

                // Close the symmetric key after insertion
                var closeKeySql = "CLOSE SYMMETRIC KEY PasswordSymmetricKey;";
                await context.Database.ExecuteSqlRawAsync(closeKeySql);
            }
        }
    }
}
