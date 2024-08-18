#!/bin/bash

TEMP_DIR="/tmp"
CACHE_DIR="/var/cache"
LOG_FILE="/var/log/cleanup.log"

# Função para exibir e registrar mensagens
function print_status {
    echo "$1" | tee -a "$LOG_FILE"
}

# limp arquivos temporários
print_status "Iniciando a limpeza dos arquivos temporários em $TEMP_DIR..."
if rm -rf "$TEMP_DIR"/*; then
    print_status "Arquivos temporários em $TEMP_DIR foram removidos com sucesso."
else
    print_status "Falha ao remover arquivos temporários em $TEMP_DIR."
fi

# limp arquivos de cache
print_status "Iniciando a limpeza dos arquivos de cache em $CACHE_DIR..."
if rm -rf "$CACHE_DIR"/*; then
    print_status "Arquivos de cache em $CACHE_DIR foram removidos com sucesso."
else
    print_status "Falha ao remover arquivos de cache em $CACHE_DIR."
fi

print_status "Limpeza concluída."

