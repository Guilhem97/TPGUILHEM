#!/bin/bash


# Copier le fichier de configuration sur le serveur

cp ./config__files/sshd_config /etc/ssh/sshd_config

cp ./config__files/ssh/Banner /etc/Banner

echo "Entrer un nom d'utilisateur : \n"
read username 
adduser $username
usermod -aG sudo $username

echo "Entrer un mot de passe : \n"
passwd $username

echo "entrer une clé public : \n"
read KeySsh
echo $KeySsh >> ~/.ssh/authorized_keys
systemctl restart sshd 

