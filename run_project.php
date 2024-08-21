<?php

function reiniciar_xampp() {
    // Diretório do XAMPP
    $xampp_dir = '/opt/lampp';

    // Comandos para parar e iniciar o XAMPP
    $comandos = [
        "sudo $xampp_dir/xampp stop",
        "sudo systemctl stop apache2",
        "sudo $xampp_dir/xampp start"
    ];

    // Executa os comandos e captura a saída
    foreach ($comandos as $comando) {
        echo "Executando: $comando\n";
        $saida = [];
        $status = null;
        exec($comando, $saida, $status);

        if ($status !== 0) {
            echo "Erro ao executar o comando: $comando\n";
            return false;
        }

        foreach ($saida as $linha) {
            echo $linha . "\n";
        }
    }

    // Verifica se os serviços foram iniciados corretamente
    echo "Verificando se os serviços estão funcionando...\n";
    $status_xampp = shell_exec("sudo $xampp_dir/xampp status");

    if (strpos($status_xampp, 'Apache') !== false && strpos($status_xampp, 'MySQL') !== false && strpos($status_xampp, 'ProFTPD') !== false) {
        echo "XAMPP iniciado com sucesso.\n";
        return true;
    } else {
        echo "Falha ao iniciar o XAMPP.\n";
        return false;
    }
}

function main() {
    // Reinicia o XAMPP e verifica se foi bem sucedido
    if (!reiniciar_xampp()) {
        return;
    }

    // Diretório htdocs do XAMPP
    $htdocs_dir = '/opt/lampp/htdocs';  // Caminho do htdocs para XAMPP no Linux

    // Solicita o nome do projeto
    echo "Digite o nome do projeto: ";
    $projeto = trim(fgets(STDIN));

    // Cria o caminho para o diretório do projeto
    $projeto_dir = $htdocs_dir . '/' . $projeto;

    // Verifica se o diretório do projeto existe
    if (!is_dir($projeto_dir)) {
        echo "O diretório do projeto '{$projeto}' não foi encontrado.\n";
        return;
    }

    // Tenta encontrar um arquivo index.html ou index.php no diretório do projeto
    $index_files = ['index.html', 'index.php'];
    foreach ($index_files as $file_name) {
        $file_path = $projeto_dir . '/' . $file_name;
        if (file_exists($file_path)) {
            echo "Arquivo '{$file_name}' encontrado. Abrindo no navegador...\n";
            $url = 'http://localhost/' . $projeto . '/' . $file_name;
            // Comando para abrir o navegador no Linux
            exec("xdg-open '$url'");
            return;
        }
    }

    // Se nenhum arquivo index.html ou index.php for encontrado
    echo "Nenhum arquivo 'index.html' ou 'index.php' encontrado no diretório do projeto.\n";
}

main();

?>
