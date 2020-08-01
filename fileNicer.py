# i want text files listing the playlists on my ipod
# itunes exports playlists as ugly text files
# this makes a nicer, more readable, txt file (albeit with less information)

import os

filePath = r"C:\Users\Surface\Desktop\coding\automatingPlaylistFiles" # all itunes output should be here
outputFolder = r"C:\Users\Surface\Desktop\coding\automatingPlaylistFiles\nice playlist text files"

music = {} # will fill this to look like:
    # {artist1 : { album1 : [song1, song2,...]
    #               album2: [song1, song2,...]},
    #  artist2: etc}
def populateMusic(fpath,fname):
    # this populates the music dictionary
    with open(os.path.join(fpath,fname), 'r', encoding="utf16", errors='ignore') as fp1:
        next(fp1)
        for line in enumerate(fp1):
            #if cnt == 0:# skips 'name   album   artist etc'
                #cnt+=1
                #continue # next(fp1) replaces this
            actualLine = line[1] 
                # for some reason, line is a tuple, line[0] is the number of the line and line[1] is the content

            try:
                artist = actualLine.split('	')[1]
                album = actualLine.split('	')[3]
                song = actualLine.split('	')[0]
                if artist in music:# then add albums
                    if album in music[artist]:# then add songs
                        music[artist][album].append(song)
                    else:
                        music[artist][album] = []# assigns {artist : {album : songs[]}}
                        music[artist][album].append(song)
                else:# then create artist key
                    music[artist] = {album : [song]}
            except:
                print("type(line): "+str(type(actualLine)))
                print("line: "+str(actualLine)+", length = "+str(len(actualLine)))
         

def readableOutput(musicDict):
    outputPath = os.path.join(outputFolder, str("Playlist_-_" + fileName))
    with open(outputPath, 'w+', encoding = "utf8") as fp2:   
        fp2.write('Artist Name:-\n   Album1: \"song1\", \"song2\",...\n   Album2: \"song1\", \"song2\",... etc\n') # a header
        for artist in musicDict:# iterate over artists
            lineToWrite = '\n'+artist + ':-' 
            for album in musicDict[artist]: # iterate over albums within an artist
                lineToWrite = lineToWrite + '\n    ' + album + ': '
                for song in musicDict[artist][album]:# iterate over songs within albums
                    lineToWrite = lineToWrite + "\""+song +"\""+ ', '

            fp2.write(lineToWrite)

def sortMusic():
    # sort music dictionary so that keys are in alphabetical order
    global music
    sortedDict = sorted(music.keys(), key = lambda x:x.lower())
    musicNew = {}
    for i in sortedDict:
        musicNew[i] = music[i]
    
    music = musicNew

directory = os.fsencode(filePath)
# loop over the text files in filePath 
for file in os.listdir(directory):
    fileName = os.fsdecode(file)
    if fileName.endswith(".txt") : 
        music.clear()
        populateMusic(filePath, fileName)
        sortMusic()
        readableOutput(music)
