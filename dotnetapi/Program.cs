var builder = WebApplication.CreateBuilder(args);

builder.Services.AddCors(options =>
{
   options.AddDefaultPolicy(builder =>
   {
      builder
   .AllowAnyOrigin()
   .AllowAnyMethod()
   .AllowAnyHeader();
   });
});

var app = builder.Build();

app.UseCors();

app.MapGet("/dotnetapi", () =>
{
    return Results.Ok("Thanks Lord from a dotnet minimal api");
});

app.Run();
