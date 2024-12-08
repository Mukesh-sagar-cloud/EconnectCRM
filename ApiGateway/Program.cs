using JwtAuthenticationManager;
using Ocelot.DependencyInjection;
using Ocelot.Middleware;

var builder = WebApplication.CreateBuilder(args);
builder.Configuration.SetBasePath(builder.Environment.ContentRootPath)
    .AddJsonFile("ocelot.json", optional: false, reloadOnChange: true)
    .AddEnvironmentVariables();
builder.Services.AddOcelot();
builder.Services.AddCustomJwtAuthentication();

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

app.UseOcelot();

app.UseAuthentication();
app.UseAuthorization();

app.Run();
