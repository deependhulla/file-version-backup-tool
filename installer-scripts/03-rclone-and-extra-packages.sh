#!/bin/sh

curl https://rclone.org/install.sh | sudo bash

cd /opt/
git clone https://github.com/kapitainsky/RcloneBrowser.git
cd -
mkdir /opt/RcloneBrowser/build
cd /opt/RcloneBrowser/build
cmake ..
make 
make install
cd -
