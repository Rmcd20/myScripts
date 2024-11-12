@echo off

REM Caminho para a pasta do MySQL no XAMPP
set MYSQL_DIR=C:\xampp\mysql

REM 1. Copia a pasta data e renomeia com um timestamp único
set timestamp=%date:~10,4%%date:~4,2%%date:~7,2%%time:~0,2%%time:~3,2%%time:~6,2%
xcopy "%MYSQL_DIR%\data" "%MYSQL_DIR%\data_old_%timestamp%" /E /I

REM 2. Entrar na pasta data e eliminar as pastas específicas e todos os ficheiros, exceto ibdata1
cd "%MYSQL_DIR%\data"
rd /s /q mysql
rd /s /q performance_schema
rd /s /q phpmyadmin
rd /s /q test

REM Remover todos os ficheiros fora das pastas, exceto ibdata1
for %%f in (*.*) do (
    if not "%%f"=="ibdata1" del "%%f"
)

REM 3. Copiar o conteúdo da pasta backup, exceto ibdata1, para data, mantendo a estrutura
cd "%MYSQL_DIR%\backup"
for /F "delims=" %%f in ('dir /s /b /a-d "%MYSQL_DIR%\backup"') do (
    if not "%%~nxf"=="ibdata1" (
        set "target=%%f"
        setlocal enabledelayedexpansion
        set "target=!target:%MYSQL_DIR%\backup=%MYSQL_DIR%\data!"
        mkdir "!target!\.." >nul 2>&1
        copy "%%f" "!target!" >nul
        endlocal
    )
)

echo Processo de reparação completo. Pode reiniciar o MySQL no XAMPP.
pause
