cd ..

if [ "$(id -u)" -ne 0 ]; then
    echo "You need to run this script as root."
    exit 1
fi

sudo sh placement.sh