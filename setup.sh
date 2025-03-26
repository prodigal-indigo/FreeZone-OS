#!/bin/bash

# FreeZone OS - Setup Script (Beta)
# Esse script instala a base do sistema e adiciona compatibilidade com apps Windows, macOS e Android

# Atualizar pacotes
echo "Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

# Instalar pacotes essenciais
echo "Instalando pacotes essenciais..."
sudo apt install -y wine winetricks anbox qemu-kvm virtualbox git wget curl

# Configurar Wine para rodar .exe
echo "Configurando Wine..."
winecfg

# Instalar Darling para rodar .dmg (macOS)
echo "Instalando Darling..."
git clone --depth=1 https://github.com/darlinghq/darling.git
cd darling && ./build.sh && sudo make install

# Configurar Anbox para rodar APKs
echo "Configurando Anbox..."
sudo modprobe ashmem_linux
sudo modprobe binder_linux

# Criar diretórios essenciais
echo "Criando diretórios essenciais..."
mkdir -p ~/FreeZoneOS/Apps ~/FreeZoneOS/Configs

# Mensagem final
echo "Instalação concluída! Agora você pode rodar .exe, .dmg e .apk no FreeZone OS."
