#!/bin/bash

# Student Unit: CSI6203
# Student Name: Yuhang Yang
# Student Number: 10513184

# Pre-check if these two files existed.
# If YES then creat a new file named Operation.txt and remove Operation_post.txt

if [ -e $Operation.txt ] | [ -e $Operation_post.txt ]; then 
    touch Operation.txt 
    rm Operation_post.txt
fi

pre="<tr><td>"
post="\/td><\/tr>"
mid="<\/td><td>"

# CAT command is to grab the content of attacks.html and pipe it through to GREP.
# GREP command is to eliminate all lines passed to it except things such as <td>. Then pipe through to SED
# SED command is to eliminate all remaining HTML tages. For doing this is to make sure </td></td> will be replaced by ' '. Then pipe through to AWK.
# AWK command is for calculating total number of ATTACKS in given three months

cat attacks.html | grep "<td>" | sed -e "s/^$pre//g; s/$post$//g; s/$mid/ /g" | awk '{ sum_num= $2+$3+$4; printf "%-20s%-15s\n", $1, sum_num }' > Operation.txt
sed  '/DDOS                1562/i\Attacks             Instances(Q3)' Operation.txt > Operation_post.txt
cat Operation_post.txt
rm Operation.txt | rm Operation_post.txt

exit 0 