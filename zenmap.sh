#!/usr/bin/bash


echo "                                  ___    __        "
echo "                       ____  _  _<  /___/ /__      "
echo "                      / __ \| |/_/ / __  / _ \     "
echo "                     / /_/ />  </ / /_/ /  __/     "
echo "                     \____/_/|_/_/\__,_/\___/     "
 
echo " "
echo " "

echo "Zenmap Installer only for Debian Based Distribution"
echo "Version 1.2.1"
echo "Developed By Ox1de"
echo "X: @ox1d3x3"
echo "Github: @ox1de-crypto"


echo " "

sleep 10


echo "Checking Update & Upgrade"

sleep 2

sudo apt update && sudo apt upgrade -y 

echo "Checking Zenmap on the system"

sleep 2

if  ! command -v zenmap &> /dev/null;
    then
        echo " Great! Zenmap is not installed "
    
elif command -v zenmap &> /dev/null; 
    then
        echo " Zenmap Found! "
        sleep 1
        echo " Attempting uninstalling zenmap "
        sleep 1;
        sudo apt remove zenmap -y ;
        echo "Done"
fi

echo " Installing Dependency tools for Zenmap"

sleep 2

echo "Checking Folder "

sleep 2

cd ~ || exit


if [ -d "ZenmapTools" ];
    then
        echo "ZenmapTools Folder Found!"
        sleep 1
        echo "Removing Folder"
        sudo rm -r ZenmapTools

fi

cd ~ || exit

echo "Creating Folder"
sleep 1

mkdir ZenmapTools

cd ZenmapTools || exit

 
echo "Downloading Dependency Tools"


if  command -v python2 &> /dev/null;
    then
        echo " "
        echo " Great! python2 is installed "
        echo " "
    
elif ! command -v python2 &> /dev/null; 
    then
        echo " Python2 not Found! "
        sleep 1
        echo " Attempting installing python2 "
        sleep 1;
        sudo apt install python2 -y ;
fi



wget http://archive.ubuntu.com/ubuntu/pool/universe/p/pygtk/python-gtk2_2.24.0-5.1ubuntu2_amd64.deb

wget http://azure.archive.ubuntu.com/ubuntu/pool/universe/p/pygobject-2/python-gobject-2_2.28.6-14ubuntu1_amd64.deb

wget http://security.ubuntu.com/ubuntu/pool/universe/p/pycairo/python-cairo_1.16.2-2ubuntu2_amd64.deb


sleep 5

echo "Done"

echo "Changing Permissions"
sleep 1 
sudo chmod +x python-cairo_1.16.2-2ubuntu2_amd64.deb python-gobject-2_2.28.6-14ubuntu1_amd64.deb python-gtk2_2.24.0-5.1ubuntu2_amd64.deb



echo " Done"

echo " Installing dependency Tools"

sudo dpkg -i python-cairo_1.16.2-2ubuntu2_amd64.deb python-gobject-2_2.28.6-14ubuntu1_amd64.deb python-gtk2_2.24.0-5.1ubuntu2_amd64.deb

echo " Done "

rm *.deb

sleep 2

echo "Downloading Zenmap"

wget https://nmap.org/dist/zenmap-7.94-1.noarch.rpm

echo "Done"

sleep 2

echo "Fixing Broken"

sudo apt --fix-broken install -y

echo " Done "

echo "Checking Alien"

sleep 2

if  ! command -v alien &> /dev/null;
    then
        echo " Alien not installed "

        sleep 2

        echo " Buckle up Alien Installing"

        sleep 2

        sudo apt install alien -y
    
elif command -v alien &> /dev/null; 
    then
        echo " Great! Alien Found "
        sleep 1
               
fi


echo "Fixing Broken"

sudo apt --fix-broken install -y

echo " Done "

echo " Attempting Convert rpm to deb"

sudo alien zenmap-7.94-1.noarch.rpm

echo "Done"

echo "Changing Permissions"

sudo chmod +x *.deb

echo "Installing Zenmap"

sleep 2

sudo dpkg -i *.deb

echo "Great Zenmap installed successfully"

sleep 2


cd ~ || exit

echo "Removing Folder"
sleep 2
sudo rm -r ZenmapTools
echo "Folder Removed"

echo " "


mainmenu() {
    echo -ne "
Do you Want to Open Zenmap?
1) Yes
2) No
[Select 1 or 2]:  "
    read -r ans
    case $ans in
    1)
        echo "Zenmap is Starting..."
        sleep 3
        sudo zenmap
        exit 0
        ;;
    2)
        echo "Thank you!."
        exit 0
        ;;
    *)
        echo "Invalid Request. Please Select 1 or 2."
        mainmenu
        ;;
    esac
}

mainmenu
