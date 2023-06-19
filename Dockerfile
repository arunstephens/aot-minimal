FROM mcr.microsoft.com/dotnet/sdk:8.0-preview AS build-env
WORKDIR /App

# Install NativeAOT build prerequisites
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       clang zlib1g-dev

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -r linux-x64 -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0-preview
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT ["/App/AotMinimal"]


