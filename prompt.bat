@ECHO OFF

CALL env\win32\setup.bat
START CMD
sh env/scripts/install.sh %ENV%\ruby %ENV%\install\ruby.rar

PAUSE
