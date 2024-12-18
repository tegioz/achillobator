#!/bin/bash

set -ouex pipefail

dnf install -y \
    gnome-extensions-app \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-dash-to-dock

#Add flathub and install the flatpaks from bluefin
sudo flatpak config --system --set languages "*"
sudo flatpak remote-add --system flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install --system -y \
app/io.github.dvlv.boxbuddyrs/x86_64/stable \
app/com.github.rafostar.Clapper/x86_64/stable \
app/org.fedoraproject.MediaWriter/x86_64/stable \
app/com.github.tchx84.Flatseal/x86_64/stable \
app/io.github.flattool.Warehouse/x86_64/stable \
app/org.gnome.baobab/x86_64/stable \
app/org.gnome.Calculator/x86_64/stable \
app/org.gnome.Calendar/x86_64/stable \
app/org.gnome.Characters/x86_64/stable \
app/org.gnome.clocks/x86_64/stable \
app/org.gnome.Connections/x86_64/stable \
app/org.gnome.Contacts/x86_64/stable \
app/org.gnome.DejaDup/x86_64/stable \
app/org.gnome.Papers/x86_64/stable \
app/com.mattjakeman.ExtensionManager/x86_64/stable \
app/org.gnome.FileRoller/x86_64/stable \
app/org.gnome.font-viewer/x86_64/stable \
app/org.gnome.Logs/x86_64/stable \
app/org.gnome.Loupe/x86_64/stable \
app/org.gnome.Maps/x86_64/stable \
app/org.gnome.NautilusPreviewer/x86_64/stable \
app/org.gnome.World.PikaBackup/x86_64/stable \
app/org.gnome.TextEditor/x86_64/stable \
app/org.gnome.Weather/x86_64/stable \
app/io.missioncenter.MissionCenter/x86_64/stable \
app/org.mozilla.firefox/x86_64/stable \
app/org.mozilla.Thunderbird/x86_64/stable \
runtime/org.gtk.Gtk3theme.adw-gtk3/x86_64/3.22 \
runtime/org.gtk.Gtk3theme.adw-gtk3-dark/x86_64/3.22 \

dnf remove -y $(dnf repoquery --installonly --latest-limit 1 -q)



systemctl enable \
    gdm.service


#### Example for enabling a System Unit File
# systemctl enable podman.socket
