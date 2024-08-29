#!/bin/bash
# install.sh

# Author: BlackLeakz
# Website: https://codehunterz.world
# Blog:    https://blog.codehunterz.world
# Board:   https://board.codehunterz.world
# Version: 0.1
# Description: This is a Server Control Panel's installation script to automatically install all server- requirements according to use nginx, phpbb3, wordpress, phpmyadmin on a headless debian-server!"


#######################SETTINGS OF VARIABLES#############################################################

export i="sudo apt-get install -y "
export gc="sudo git clone "


sudo apt-get update 
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
sudo apt-get autoremove -y 










function build() {
    echo -e "Console > Installing necessary build packages!."
    $i make cmake build-essential sof*prop*c* curl git wget python3-dev python3-pip python3-venv
    $i golang 
    $i clang gcc 
    $i libc6
}

function nginx() {
    echo -e "Console > Installing NGINX-WebServer and Firewall!."
    $i nginx-full ufw fail2ban
    sudo systemctl enable nginx --now
}

function php() {
    echo -e "Console > Installing PHP!."
    $i php*fpm php php*cli php*mysql php*curl php*common php*mbstring php*xml
    $i php*mysql 
    $i php*json 
    $i php*opcache php*gd 
    $i php*bcmath php*soap php*mysqlnd php*intl php*zip
    sudo systemctl enable php8.2-fpm --now
    sudo systemctl enable php-fpm --now
}

function mysql() {
    echo -e "Console > Installing MYSQL Client and Server!."
    $i mariadb-client mariadb-server
    sudo systemctl enable mariadb --now
    
}


function setup_mysql() {
    udo chmod a+x -R MYSQL/setup.sh
    sudo ./MYSQL/setup.sh
}






function phpbb3() {

}

function wordpress() {
    
}





function auto_install() {

    build;
    nginx;
    php;
    mysql;
}



function manual_install() {
    while true;
    do
    HEIGHT=15
    WIDTH=40
    CHOICE_HEIGHT=4
    TITLE="Server Installer || (c)odehunterz.world"
    MENU="Wählen Sie eine Option:"

    OPTIONS=(1 "Install Build-Dependencies"
             2 "Install WebServer"
             3 "Install PHP"
             4 "Install MYSQL"
             5 "Beenden")

    CHOICE=$(dialog --clear \
                    --backtitle "Linux Shell Script Tutorial" \
                    --title "$TITLE" \
                    --menu "$MENU" \
                    $HEIGHT $WIDTH $CHOICE_HEIGHT \
                    "${OPTIONS[@]}" \
                    2>&1 >/dev/tty)

    clear
    case $CHOICE in
        1)
            echo -e "Console > Start installing build-dependencies!."
            build
            ;;
        2)
            echo -e "Console > Start installing NGINX Webserver!."
            nginx
            ;;
        3) 
            echo -e "Console > Start installing PHP!."
            php
            ;;
        4) 
            echo -e "Console > Start installing MYSQL!."
            mysql
            ;;
        5)
            echo -e "Console > Exiting application!"
            exit
            ;;
    esac
    done 
}





function menu() {
while true;
do
    HEIGHT=15
    WIDTH=40
    CHOICE_HEIGHT=4
    TITLE="Server Installer || (c)odehunterz.world"
    MENU="Wählen Sie eine Option:"

    OPTIONS=(1 "Auto Install requirements"
             2 "Manual Install requirements"
             3 "Install phpBB3"
             4 "Install Wordpress"
             5 "Setup MYSQL"
             6 "Beenden")

    CHOICE=$(dialog --clear \
                    --backtitle "Linux Shell Script Tutorial" \
                    --title "$TITLE" \
                    --menu "$MENU" \
                    $HEIGHT $WIDTH $CHOICE_HEIGHT \
                    "${OPTIONS[@]}" \
                    2>&1 >/dev/tty)

    clear
    case $CHOICE in
        1)
            echo -e "Console > Start installing necessary packages!."
            auto_install
            ;;
        2)
            echo -e "Console > Start manual install!."
            manual_install
            ;;
        3) 
            echo -e "Console > Start installing phpBB3!."
            phpbb3
            ;;
        4) 
            echo -e "Console > Start installing Wordpress!."
            wordpress
            ;;
        5) 
            echo -e "Console > Setup MYSQL!."
            setup_mysql
            ;;
        6)
            echo -e "Console > Exiting application!"
            exit
            ;;
    esac
done 
}



function main() {
    menu;


}



main;