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

cd ..

dotnet sln add "$Name".Server/"$Name".Server.csproj
dotnet sln add "$Name".Core/"$Name".Core.csproj
dotnet sln add Database/"$Name".Database.Context/"$Name".Database.Context.csproj
dotnet sln add Database/"$Name".Database.Models/"$Name".Database.Models.csproj
dotnet sln add Database/"$Name".Database.Repositories/"$Name".Database.Repositories.csproj

sed -i '5,6d' Database/"$Name".Database.Context/"$Name".Database.Context.csproj
sed -i '5,6d' Database/"$Name".Database.Models/"$Name".Database.Models.csproj
sed -i '5,6d' Database/"$Name".Database.Repositories/"$Name".Database.Repositories.csproj
sed -i '5,6d' "$Name".Core/"$Name".Core.csproj
sed -i '4d' "$Name".Server/"$Name".Server.csproj

sed -i '5i\    <Nullable>enable</Nullable>\' Database/"$Name".Database.Context/"$Name".Database.Context.csproj
sed -i '6i\    <TreatWarningsAsErrors>true</TreatWarningsAsErrors>\' Database/"$Name".Database.Context/"$Name".Database.Context.csproj
sed -i '7i\    <ImplicitUsings>enable</ImplicitUsings>\' Database/"$Name".Database.Context/"$Name".Database.Context.csproj

sed -i '5i\    <Nullable>enable</Nullable>\' Database/"$Name".Database.Models/"$Name".Database.Models.csproj
sed -i '6i\    <TreatWarningsAsErrors>true</TreatWarningsAsErrors>\' Database/"$Name".Database.Models/"$Name".Database.Models.csproj
sed -i '7i\    <ImplicitUsings>enable</ImplicitUsings>\' Database/"$Name".Database.Models/"$Name".Database.Models.csproj

sed -i '5i\    <Nullable>enable</Nullable>\' Database/"$Name".Database.Repositories/"$Name".Database.Repositories.csproj
sed -i '6i\    <TreatWarningsAsErrors>true</TreatWarningsAsErrors>\' Database/"$Name".Database.Repositories/"$Name".Database.Repositories.csproj
sed -i '7i\    <ImplicitUsings>enable</ImplicitUsings>\' Database/"$Name".Database.Repositories/"$Name".Database.Repositories.csproj

sed -i '5i\    <Nullable>enable</Nullable>\' "$Name".Core/"$Name".Core.csproj
sed -i '6i\    <TreatWarningsAsErrors>true</TreatWarningsAsErrors>\' "$Name".Core/"$Name".Core.csproj
sed -i '7i\    <ImplicitUsings>enable</ImplicitUsings>\' "$Name".Core/"$Name".Core.csproj

sed -i '4i\    <TargetFramework>net6.0</TargetFramework>\' "$Name".Server/"$Name".Server.csproj
sed -i '5i\    <Nullable>enable</Nullable>\' "$Name".Server/"$Name".Server.csproj
sed -i '6i\    <TreatWarningsAsErrors>true</TreatWarningsAsErrors>\' "$Name".Server/"$Name".Server.csproj
sed -i '7i\    <ImplicitUsings>enable</ImplicitUsings>\' "$Name".Server/"$Name".Server.csproj

rm Database/"$Name".Database.Context/Class1.cs
rm Database/"$Name".Database.Models/Class1.cs
rm Database/"$Name".Database.Repositories/Class1.cs
rm "$Name".Core/Class1.cs
rm "$Name".Server/WeatherForecast.cs
rm "$Name".Server/Controllers/WeatherForecastController.cs
