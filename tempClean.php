<?php

function deleteFilesFromDirectory($directory) {
    if (!is_dir($directory)) {
        echo "Directory not found or inaccessible: $directory\n";
        return;
    }

    $items = scandir($directory);
    foreach ($items as $item) {
        if ($item == '.' || $item == '..') {
            continue;
        }
        
        $path = $directory . DIRECTORY_SEPARATOR . $item;
        
        try {
            if (is_dir($path)) {
                deleteFilesFromDirectory($path);
                rmdir($path);
                echo "Removed directory: $path\n";
            } else {
                unlink($path);
                echo "Removed file: $path\n";
            }
        } catch (Exception $e) {
            echo "Could not remove item: $path. Error: " . $e->getMessage() . "\n";
        }
    }
}

// Directories to clean
$directories = [
    getenv('TEMP'), 
    $_SERVER['SystemRoot'] . DIRECTORY_SEPARATOR . 'Temp',
    $_SERVER['SystemRoot'] . DIRECTORY_SEPARATOR . 'Prefetch'
];

foreach ($directories as $directory) {
    deleteFilesFromDirectory($directory);
}

echo "Cleanup complete.\n";

?>
