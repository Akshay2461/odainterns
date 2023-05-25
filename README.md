if mysql-workbench-community --version >/dev/null 2>&1; then
   echo "MySQL Workbench is already installed."
   exit 0
fi

if command -v apt-get >/dev/null 2>&1; then
           wget https://dev.mysql.com/get/mysql-apt-config_0.8.25-1_all.deb --no-check-certificate
           sudo dpkg -i mysql-apt-config_0.8.25-1_all.deb
           sudo apt update
           sudo snap install mysql-workbench-community


else
    echo "Unable to determine the package manager. Please install MySQL Workbench manually."
    exit 1
fi

mysql-workbench-community --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "MySQL Workbench installation failed. Cleaning up..."
    sudo snap remove mysql-workbench-community
    exit 1
fi

exit