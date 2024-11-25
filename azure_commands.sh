export APP_SERVICE_RG=dev-eus2-rg-appservice-000
export APP_SERVICE_PLAN=dev-eus2-appservice-flask-basic-website-000
export APP_SERVICE_WEBAPP=dev-eus2-webapp-flask-basic-website-000

az group create --name $APP_SERVICE_RG --location eastus2

az appservice plan create --name $APP_SERVICE_PLAN --resource-group $APP_SERVICE_RG --sku B1 --is-linux

az webapp create --resource-group $APP_SERVICE_RG --plan $APP_SERVICE_PLAN --name $APP_SERVICE_WEBAPP --runtime "PYTHON:3.12"


az webapp deploy --resource-group $APP_SERVICE_RG --name $APP_SERVICE_WEBAPP --src-path app.zip

az webapp deployment source config-local-git --resource-group $APP_SERVICE_RG --name $APP_SERVICE_WEBAPP

git remote add azure https://github.com/juansidberry/flask-basic-website.git
git push azure main

dev-eus2-webapp-juansidberry-000.azurewebsites.net