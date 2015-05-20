#!/bin/bash

#Escrito Por Atrícia Sabino 19/05/2015

#Primeiro Verifique seu Hostname

NameAtual=$(cat /etc/hostname)

echo "O Nome do Seu Hostname é $NameAtual"

#Mudando Hostname da Maquina - Padrao LSBD

echo 'Por Favor, Digite um Hostname para sua Maquina Linux! :D '
read HOSTNAME

#Hora de Mudar Hostname Nos Arquivos de Configuração OBS: Pode precisar do sudo

sed -i "s/$NameAtual/$HOSTNAME/g" /etc/hosts
sed -i "s/$NameAtual/$HOSTNAME/g" /etc/hostname


#Mostrando Novo Nome do HostName

echo 'Agora, Querido Usuário Linux... Seu Novo Hostname é $HOSTNAME'
 

#Entrar no Diretorio e Executar um script 

echo 'Digite o Diretorio que você baixou o Outro Script, Epero que seja o Download :D'
read diretorio 


if [ -e "$diretorio"]; then 

./Scritp2.sh

echo "Executando Scritp"

fi

#Comandos para Adcionar a Maquina No Active Directory 
#Tem os comandos que usam o Dominio do LSBD

opt/pbis/config

/opt/pbis/bin/config AssumeDefaultDomain true

#Adicionar Usuario como Root no /etc/sudoers

echo 'Digite o Nome Usuário de Rede: '
read User

echo '$User ALL=(ALL:ALL) ALL' >> /etc/sudoers


#Reiniciar Para Formalaizar as Mudanças

echo 'Nãooo Se Irrite!!! Mas, precismaos reiniciar sua máquina, BLZ'
read -s -n 1 -p "Precione Qualquer tecla para confirmar que concorda"

sudo reboot 
