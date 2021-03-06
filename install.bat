@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set APP_PATH=%HOME%\vimcode
IF NOT EXIST "%APP_PATH%" (
    call git clone https://github.com/sherylynn/vimcode.git "%APP_PATH%"
) ELSE (
    @set ORIGINAL_DIR=%CD%
    echo updating vimcode
    chdir /d "%APP_PATH%"
    call git pull
    chdir /d "%ORIGINAL_DIR%"
    call cd "%APP_PATH%"
)
call rm "%HOME%\.vimrc"
call rm "%HOME%\_vimrc" 
call rm "%HOME%\AppData\Local\nvim\init.vim"
call rm "%HOME%\.eslintrc.json"
call rm "%HOME%\.eslintrc.js"
call rm "%HOME%\.npmrc"
call rm "%HOME%\.tern-config" 
call rmdir "%HOME%\AppData\Local\nvim"
call rmdir "%HOME%\.vim" 

call mklink "%HOME%\.vimrc" "%APP_PATH%\config\vimrc"
call mklink "%HOME%\_vimrc" "%APP_PATH%\config\vimrc"
call mklink /J "%HOME%\AppData\Local\nvim" "%APP_PATH%\"
call mklink "%HOME%\AppData\Local\nvim\init.vim" "%APP_PATH%\config\vimrc"
call mklink "%HOME%\.eslintrc.json" "%APP_PATH%\config\eslintrc.json"
call mklink "%HOME%\.tern-config" "%APP_PATH%\config\tern-config"
::不再覆盖npmrc call mklink "%HOME%\.npmrc" "%APP_PATH%\config\npmrc"
call mklink /J "%HOME%\.vim" "%APP_PATH%\"

IF NOT EXIST "%APP_PATH%\plugged" (
    call mkdir "%APP_PATH%\plugged"
)
::下载vim-plug
call curl -fLo %USERPROFILE%/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


call proxy.bat
call vim -c "GoInstallBinaries" -c "qa"
call npm i -g eslint eslint-plugin-vue eslint_d eslint-plugin-babel eslint-plugin-react eslint-plugin-react-native babel-eslint eslint-config-airbnb  --registry=http://registry.npm.taobao.org
