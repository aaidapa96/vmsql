sudo su
apt update
apt-get install mssql-tools unixodbc-dev
sudo apt-get install -y curl apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
apt install python3-pip
sqlcmd -S aaidapasql.database.windows.net -U sqladmin -d userdb -Q "CREATE TABLE Users (Name NVARCHAR(100), Email NVARCHAR(100));"
git clone https://github.com/aaidapa96/vmsql.git
cd vmsql
pip3 install -r requirements.txt
python3 app.py
