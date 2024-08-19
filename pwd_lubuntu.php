<?php
// Solicita a descrição de uso ao usuário
echo "Digite a descrição de uso: ";
$description = trim(fgets(STDIN));

// Define o fuso horário para Portugal
date_default_timezone_set("Europe/Lisbon");

// Captura a hora exata de execução
$timeTest = date("H:i:s");

// Gera uma senha aleatória
$password = bin2hex(random_bytes(8));

// Concatena a senha aleatória com a hora, colocando a hora no final
$connectPWD = $password . $timeTest;

// Caminho do arquivo onde a senha será salva
$filePath = '/home/rd/Projects/php/safe.txt';

// Verifica se o diretório existe
if (!file_exists(dirname($filePath))) {
    mkdir(dirname($filePath), 0777, true);
}

// Prepara o conteúdo para ser salvo no arquivo
$content = "Descrição: $description\nSenha: $connectPWD\n\n";

// Salva o conteúdo no arquivo
file_put_contents($filePath, $content, FILE_APPEND);

// Exibe a senha gerada e confirma o salvamento
echo "Senha gerada e salva com sucesso!\n";
echo "Senha: $connectPWD\n";
echo "Descrição: $description\n";
?>
