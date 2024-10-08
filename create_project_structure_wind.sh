#!/bin/bash

# Solicita o nome do projeto ao usuário
read -p "Digite o nome da pasta do projeto: " PROJECT_NAME

# Diretório base para o projeto
# Altere aqui se necessário
PROJECT_DIR="C:/xampp/htdocs/$PROJECT_NAME"

# Verificar se o nome do projeto está vazio
if [ -z "$PROJECT_NAME" ]; then
    echo "O nome do projeto não pode ser vazio."
    exit 1
fi

# Criar estrutura de diretórios
mkdir -p "$PROJECT_DIR/src/model" \
         "$PROJECT_DIR/src/controller" \
         "$PROJECT_DIR/src/js" \
         "$PROJECT_DIR/src/css" \
         "$PROJECT_DIR/src/aux"

# Criar arquivos
touch "$PROJECT_DIR/index.html" \
      "$PROJECT_DIR/main.php" \
      "$PROJECT_DIR/menu.php"

# Criar arquivos dentro do diretório src/model
touch "$PROJECT_DIR/src/model/modelxxx.php"

# Criar arquivos dentro do diretório src/controller
touch "$PROJECT_DIR/src/controller/controllerxxx.php"

# Criar arquivos dentro do diretório src/js
touch "$PROJECT_DIR/src/js/xxx.js"

# Criar arquivos dentro do diretório src/css
touch "$PROJECT_DIR/src/css/style.css"

echo "Estrutura de diretórios criada em $PROJECT_DIR."
