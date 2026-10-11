#!/bin/bash

echo "Student Information"
echo "Name: Almas"
echo "Surname: Kaisbayev"
echo "Group: IT2-2306"
echo "Student ID: 37388"
echo "==================="
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current date: $(date)"
echo "Operating system: $(uname -s)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h

echo ""
if [ -f "../YourSurname_YourName_info.txt" ] || [ -f "YourSurname_YourName_info.txt" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
