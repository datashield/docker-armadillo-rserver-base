#!/bin/bash
echo "hier ben ik"
# https://arrow.apache.org/install/
apt update
apt install -y ca-certificates lsb-release wget
if [ $(lsb_release --codename --short) = "stretch" ]; then
  tee /etc/apt/sources.list.d/backports.list <<APT_LINE
deb http://deb.debian.org/debian $(lsb_release --codename --short)-backports main
APT_LINE
fi
# get the LATEST version of Arrow
wget https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb
apt install -y ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb
apt update
apt install -y libarrow-dev # For C++
apt install -y libarrow-glib-dev # For GLib (C)
apt install -y libarrow-dataset-dev # For Arrow Dataset C++
apt install -y libarrow-flight-dev # For Flight C++
apt install -y libparquet-dev # For Apache Parquet C++
apt install -y libparquet-glib-dev # For Apache Parquet GLib (C)
