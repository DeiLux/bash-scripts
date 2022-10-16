#creating a default project dotnet
Name="Rat"

mkdir src
cd src

dotnet new sln -n "$Name"
dotnet new classlib -n "$Name".Core
dotnet new webapi -n "$Name".Server -f net5.0

mkdir Database
cd Database

dotnet new classlib -n "$Name".Database.Context
dotnet new classlib -n "$Name".Database.Models
dotnet new classlib -n "$Name".Database.Repositories