#!/bin/bash

# qual a localização da pasta
read -p "Digite o caminho para a pasta do projeto: " pasta

# Navegar para a pasta do projeto
cd "$pasta" || { echo "Não foi possível acessar o diretório: $pasta"; exit 1; }

# qual o nome do repositório
read -p "Digite o nome do repositório: " repositorio

# Inicializar o repositório Git
git init
echo "Repositório Git inicializado."

# Adicionar todos os arquivos e fazer o primeiro commit
git add .
git commit -m "Primeiro commit"
echo "Commit inicial realizado."

# Add repositório remoto
remote_url="git@github.com:Rmcd20/$repositorio.git"
git remote add origin "$remote_url"
echo "Repositório remoto adicionado: $remote_url"

# Puxar e integrar mudanças do repositório remoto (se houver)
git pull origin main --rebase

# Enviar os arquivos para o repositório remoto
git push -u origin main
echo "Repositório configurado e arquivos enviados com sucesso!"
