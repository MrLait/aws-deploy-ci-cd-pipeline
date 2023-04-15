# Базовый образ, используемый для сборки приложения
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Создание рабочей директории для копирования исходных кодов
WORKDIR /app

# Копирование проекта в Docker-контейнер
COPY src/HttpCodeDeploy .

# Сборка приложения в рамках Docker-контейнера
RUN dotnet publish -c Release -o out

# Базовый образ, используемый для запуска приложения
FROM mcr.microsoft.com/dotnet/aspnet:6.0

# Создание рабочей директории для размещения приложения
WORKDIR /app

# Копирование собранного приложения из предыдущего этапа
COPY --from=build /app/out .

# Запуск приложения
ENTRYPOINT ["dotnet", "HttpCodeDeploy.dll"]
