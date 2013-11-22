import re, os

file = open("fullList","r")
jobs = file.readlines()
file.close()

file = open("ConfFile_cfg.py","r")
scriptLine = file.readlines()
file.close()

for job in jobs:
    goodJob = job[:-1]
    outFile = open(goodJob+"/"+goodJob+".py","w")
    for line in scriptLine:
        if len(re.split("fileNames",line))> 1:
            outFile.write("fileNames = cms.untracked.vstring(\n")
            file = open("list_"+goodJob,"r")
            fileNames = file.readlines()
            file.close()
            for aFichier in fileNames:
                outFile.write("'"+aFichier[:-1]+"',\n")
            outFile.write(")\n")
            continue
        if len(re.split("outputFile",line))> 1:
            outFile.write("outputFile = cms.string('/tmp/hbrun/tree_"+goodJob+".root')\n")
            continue
        outFile.write(line)

