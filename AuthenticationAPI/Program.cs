using Entities.Models;
using JwtAuthenticationManager;
using UserMicroservice.Repository;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.


builder.Services.AddControllers();
builder.Services.AddSingleton<JwtTokenHandler>();
builder.Services.AddScoped<IAccountService, AccountService>();

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowSpecificOrigin", builder =>
    {
        builder.WithOrigins("http://localhost:4200")  // Allow only this origin
               .AllowCredentials()  // Allow credentials
               .AllowAnyHeader()  // Allow any header
               .AllowAnyMethod();  // Allow any HTTP method (GET, POST, etc.)
    });
});

var app = builder.Build();
app.UseCors("AllowSpecificOrigin");
// Configure the HTTP request pipeline.


app.UseAuthorization();
app.MapControllers();

app.Run();
