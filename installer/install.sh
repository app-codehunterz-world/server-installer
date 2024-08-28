#!/bin/bash
# install.sh

# Author: BlackLeakz
# Website: https://codehunterz.world
# Blog:    https://blog.codehunterz.world
# Board:   https://board.codehunterz.world
# Version: 0.1
# Description: This is a Server Control Panel's installation script to automatically install all server- requirements according to use nginx, phpbb3, wordpress, phpmyadmin on a headless debian-server!"


#######################SETTINGS OF VARIABLES#############################################################
export u="sudo apt-get update "
export i="sudo apt-get install -y "
export g="sudo apt-get upgrade -y "
export gr="sudo apt-get dist-upgrade -y "
export ar="sudo apt-get autoremove -y "

export gc="sudo git clone "



$u 
$g 
$gr
$ar 




