
numBool = False
listNum = 0
while(not numBool):
    listNum = input("How many playlists do you have? ")
    if listNum.isnumeric():
        numBool = True

lines = []
with open(r"C:\Users\Surface\Desktop\exportPlaylists.ahk", "r") as f1:    
    for line in f1:
        if line.startswith("while"):
            l = "while(i<"+str(listNum)+")\n"
            lines.append(l)
        else:
            lines.append(line)



with open(r"C:\Users\Surface\Desktop\exportPlaylists.ahk", "w+") as f2:    
    for l in lines:
        f2.write(l)



