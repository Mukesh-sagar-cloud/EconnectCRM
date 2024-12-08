using Entities.Models;
using Entites.Models;
using JWTAuthenticationManager.Models;
using JwtAuthenticationManager;
using System.Security.Cryptography;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace UserMicroservice.Repository
{
    public class UserService
    {
        private readonly EconnectContext _context;

        public UserService(EconnectContext context)
        {
            _context = context;
        }

        public string DecryptPassword(byte[] encryptedPassword)
        {
            var sqlQuery = @"
            OPEN SYMMETRIC KEY PasswordSymmetricKey 
            DECRYPTION BY CERTIFICATE PasswordEncryptionCert;

            SELECT CONVERT(NVARCHAR(50), DECRYPTBYKEY(@EncryptedPassword)) AS DecryptedPassword;

            CLOSE SYMMETRIC KEY PasswordSymmetricKey;";

            var decryptedPassword = _context.Logins
                .FromSqlRaw(sqlQuery, new SqlParameter("@EncryptedPassword", encryptedPassword))
                .AsEnumerable() // Ensure execution before accessing the result
                .Select(r => r.DecryptedPassword)
                .FirstOrDefault();

            return decryptedPassword;
        }
    }

}
