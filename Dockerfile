FROM microsoft/dotnet:sdk AS build-env
WORKDIR /DockerTest

# Copy csproj and restore as distinct layers
COPY DockerTest/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY DockerTest/. ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /DockerTest
COPY --from=build-env /DockerTest/DockerTest/bin/Debug/netcoreapp2.1 .
ENTRYPOINT ["dotnet", "DockerTest.dll"]