#!/bin/bash
# WARNING: Will delete the log, dump and intermediate files

EXE_NAME=soapBubble-full-dvg

COLOR='\033[0;33m' # Yellow
NC='\033[0m'       # No Color

# CLEAN
# ---------------
echo -e "${COLOR}Deleting file: dump${NC}"
rm dump
echo -e "${COLOR}Deleting file: log${NC}"
rm log

echo -e "${COLOR}Deleting intermediate files:${NC}"
cd intermediate/
ls snapshot*.* -l -h
rm snapshot*.*
cd ..

# COMPILE
# ---------------
echo -e "\n${COLOR}Compiling ${EXE_NAME}${NC}"
qcc -O2 -Wall -fopenmp -disable-dimensions $EXE_NAME.c -o $EXE_NAME -lm

# RUN
# ---------------
echo -e "\n${COLOR}Running ${EXE_NAME}${NC}"
./$EXE_NAME


echo -e "\033[0;32m"
#read -p "Press any key to finish...""
echo -e "${NC}"