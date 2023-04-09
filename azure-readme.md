# webMushra on Azure

## Changes from [upstream](https://github.com/audiolabs/webMUSHRA)
- [`default.yaml`](configs/default.yaml) updated to run required experiment.
- FLAC files for experiment added to [`audio` folder](configs/resources/audio/).
- [`azure.Caddyfile`](azure.Caddyfile) and [`azure-caddy.Dockerfile`](azure-caddy.Dockerfile) added for caddy reverse proxy Docker image.
- [`azure-php.Dockerfile`](azure-php.Dockerfile) added for [php-fpm](https://www.php.net/manual/en/install.fpm.php) PHP FastCGI Docker image.
- [`azure-docker-compose.yml`](azure-docker-compose.yml) added to define application when deployed to Azure, including ports and volumes.

## Create Azure resources

1. Sign-up for Azure pay-as-you-go.
2. Login to [Azute portal](https://portal.azure.com/#home).
3. Create webmushra Azure resource group.
4. Create webmushradeep Azure container registry.
5. Create webmushra Azure storage account.
6. Create `certs` fileshare in storage account.
7. Create `results` fileshare in storage account.

## Build and deploy application

1. [Install `docker-aci`](https://docs.docker.com/cloud/aci-integration/#install-the-docker-compose-cli-on-linux).
2. Login:
```
docker-aci login azure
```
3. Create Azure context:
```
docker context create aci webmushra
```
4. Build and push container images:
```
docker-aci build -f azure-php.Dockerfile -t webmushradeep.azurecr.io/php:latest .
docker-aci push webmushradeep.azurecr.io/php:latest
docker-aci build -f azure-caddy.Dockerfile -t webmushradeep.azurecr.io/caddy:latest .
docker-aci push webmushradeep.azurecr.io/caddy:latest
```
5. Deploy application:
```
docker-aci --context webmushra compose -f azure-docker-compose.yml up
```

Application available at: https://webmushra.uksouth.azurecontainer.io

To destroy the application:
```
docker-aci --context webmushra compose -f azure-docker-compose.yml down
```
