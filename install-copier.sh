#!/usr/bin/env bash

update-upgrade () {

apt update -y  && apt upgrade -y

}

install-package () {

# test update

apt install $1 -y

}



install-rclone () {

#
# install rclone
#

local DOWNLOAD_LINK="https://beta.rclone.org/rclone-beta-latest-linux-amd64.zip"
local RCLONE_ZIP="rclone-beta-latest-linux-amd64.zip"
local UNZIP_DIR="/tmp/rclone-temp"

curl -O $DOWNLOAD_LINK
mkdir -p $UNZIP_DIR

/usr/bin/unzip -a $RCLONE_ZIP -d $UNZIP_DIR
cd $UNZIP_DIR/*
cp rclone /usr/bin/rclone.new
    chmod 755 /usr/bin/rclone.new
    chown root:root /usr/bin/rclone.new
    mv /usr/bin/rclone.new /usr/bin/rclone
    #manuals
    mkdir -p /usr/local/share/man/man1
    cp rclone.1 /usr/local/share/man/man1/
    mandb

}

config-rclone () {

echo hello
}

#
# This is where the "stuff" happens

update-upgrade
install-package "unzip"
install-rclone