#Installs the script folder
echo -ne "\033]0;Serial Instillation\007"
echo "Warning!!!!: YOU WILL BE ASKED TO RUN AS ROOT DURING INSTALL"
#Path of the scripts
pth=$(dirname "${BASH_SOURCE[0]}")
#Install Location
echo "Enter install location that you want (Use 'dmv' for do not move}"
read pt
if [ "$pt" == "dmv" ] || [ "$pt" == "DMV" ];
then
    pt=$pth
else
    sudo cp -r $pth/* $pt
    sudo rm "$pt/install.sh"
fi
usr=`echo "$USER"`
#Writes root privilages to sudoers
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/menus/agconnectionsmenu.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/menus/cconnectionsmenu.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/menus/fconnectionsmenu.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/menus/tgconnection.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/menus/ugconnection.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/tcommands/logoutput.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/tcommands/newcommand.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/tcommands/newconnection.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/tcommands/openlogsfolder.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/tcommands/screenterm.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/tcommands/showcommands.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/tcommands/updatecommands.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/connect.sh' >> /etc/sudoers"
sudo sh -c "echo '$usr ALL=(ALL) NOPASSWD:$pt/serialmenu.sh' >> /etc/sudoers"

#Dependacies
sudo apt-get install putty -y
sudo apt-get install thunar -y
sudo apt-get install screen -y
