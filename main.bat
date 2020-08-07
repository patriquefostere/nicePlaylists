@echo off
REM  plug in ipod, open itunes, wait for itunes to register ipod, 
rem then run getPlaylistsNum.py, then run exportPlaylists.ahk, then run fileNicer.py

del "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\*.txt" /f /q
del "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\nice playlist text files\*.txt" /f /q
REM delete pre-existing playlist text files to make the program simpler; there shouldn't be any important text files in this directory

start /wait /b "C:\Users\Surface\AppData\Local\Programs\Python\Python38-32\python.exe" ^
"C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\getPlaylistsNum.py"

start /wait /b "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\AutoHotKey.exe" ^
"C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\exportPlaylists.ahk"

start /wait /b "C:\Users\Surface\AppData\Local\Programs\Python\Python38-32\python.exe" ^
"C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\fileNicer.py" 

del "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\*.txt" /f /q
REM Just to keep the folder tidy
    
echo Nicer playlist text files saved to C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\nice playlist text files.

REM problem: if you say you have only 1 playlist, fileNicer seems to not run?