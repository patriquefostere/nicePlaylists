REM  run getPlaylistsNum.py, then run exportPlaylists.ahk, then run fileNicer.py

@echo off
if exist "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\*.txt" ^
    del "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\*.txt" /f /q
if exist "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\nice playlist text files\*.txt" ^
    del "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\nice playlist text files\*.txt" /f /q
REM delete pre-existing playlist text files to make the program simpler; there shouldn't be any important text files in this directory.
REM i have tried to make the autohotkey file deal with overwriting files but this is easier
rem should be empty of text files any since we delete them afterwards

start /wait /b "C:\Users\Surface\AppData\Local\Programs\Python\Python38-32\python.exe" ^
    "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\getPlaylistsNum.py"
start /wait /b "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\AutoHotKey.exe" ^
    "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\exportPlaylists.ahk"

REM delete on-the-go playlists because those occur on my ipod as glitch (or at least they are undesirable)
if exist "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\On-The-Go.txt" ^ 
    del "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\On-The-Go.txt"

rem make the playlist.txt files more readable
start /wait /b "C:\Users\Surface\AppData\Local\Programs\Python\Python38-32\python.exe" ^
    "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\fileNicer.py" 

if exist "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\*.txt" ^
    del "C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\*.txt" /f /q
    REM Just to keep the folder tidy

echo Nicer playlist text files saved to C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\nice playlist text files.

REM problem: if you say you have only 1 playlist, fileNicer seems to not run?