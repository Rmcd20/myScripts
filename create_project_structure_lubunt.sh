#!/bin/bash

#  o nome do projeto
read -p "Digite o nome da pasta do projeto: " PROJECT_NAME

# Diretório base para o projeto
#Aqui change se for necessário
PROJECT_DIR="/opt/lampp/htdocs/$PROJECT_NAME"

# Verificar se o nome do projeto esta vazio
if [ -z "$PROJECT_NAME" ]; then
    echo "O nome do projeto não pode ser vazio."
    exit 1
fi

# Criar estrutura  e arquivos
mkdir -p "$PROJECT_DIR/src/model" \
         "$PROJECT_DIR/src/controller" \
         "$PROJECT_DIR/src/js" \
         "$PROJECT_DIR/src/css" \
         "$PROJECT_DIR/src/aux"

#  arquivos 
touch "$PROJECT_DIR/index.html" \
      "$PROJECT_DIR/main.php" \
      "$PROJECT_DIR/menu.php"

#  arquivos dentro do diretório src/model
touch "$PROJECT_DIR/src/model/modelxxx.php"

#  arquivos dentro do diretório src/controller
touch "$PROJECT_DIR/src/controller/controllerxxx.php"

#  arquivos dentro do diretório src/js
touch "$PROJECT_DIR/src/js/xxx.js"

#  arquivos dentro do diretório src/css
touch "$PROJECT_DIR/src/css/style.css"

echo "Estrutura de diretório criada em $PROJECT_DIR."
