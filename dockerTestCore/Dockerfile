FROM microsoft/aspnetcore-build:2.1

WORKDIR /app

# Copy csproj and restore as distinct layers
COPY . .

RUN dotnet build -c Release

ENTRYPOINT ["dotnet", "run", "--no-launch-profile"]