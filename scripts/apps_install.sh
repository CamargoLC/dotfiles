#!/bin/bash

sudo xbps-install -S void-repo-multilib void-repo-nonfree void-repo-multilib-nonfree

sudo xbps-install -Su

sudo xbps-install NetworkManager PrismLauncher alacritty alsa-plugins-pulseaudio alsa-utils autoconf automake base-devel blueman bluez brightnessctl bspwm btop cava chrony cryptsetup curl dbus dialog dunst elogind fastfetch feh flameshot flatpak gdb git keepassxc mesa-intel-dri nasm ncurses-devel neovim network-manager-applet ntfs-3g nvidia580 nvidia580-dkms nvidia580-libs nvidia580-libs-32bit openjdk21 pamixer papirus-icon-theme pavucontrol picom psmisc pulseaudio ranger rofi slock sxhkd tmux tty-clock unzip wget wireguard-tools xclip xdg-desktop-portal xdg-desktop-portal-gtk xdg-user-dirs xf86-video-intel xinit xmirror xorg
