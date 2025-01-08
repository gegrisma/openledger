#!/bin/bash

function pasang() {
    echo "Install Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh || true
    sh get-docker.sh || true
    sudo rm -r get-docker.sh || true

    echo "Update sistem..."
    sudo apt update && sudo apt upgrade -y || true

    echo "Install Xrdp..."
    apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils xrdp -y || true
    adduser xrdp ssl-cert || true

    echo "Install Openledger..."
    wget https://cdn.openledger.xyz/openledger-node-1.0.0-linux.zip || true
    sudo apt install -y unzip screen || true
    unzip openledger-node-1.0.0-linux.zip || true
    sudo dpkg -i openledger-node-1.0.0.deb || true
    echo "✅ Selesai. tinggal login di rdp dengan user root mu"
}

function busek() {
    echo "Menghapus..."
    sudo apt remove -y openledger-node || true
    sudo apt autoremove -y || true
    sudo rm -rf openledger-node-1.0.0-linux.zip || true
    echo "Terhapus."
}

while true; do
    echo "========================"
    echo "Instalisasi OpenLedger 1.0.0"
    echo "Pilih bos :"
    echo "1. Install"
    echo "2. Hapus Instalasi"
    echo "3. Keluar"
    read -p "Pilih menu: " mileh

    case $mileh in
        1) pasang ;;
        2) busek ;;
        3) echo "Keluar..."; break ;;
        *) echo "Waduh." ;;
    esac
done
