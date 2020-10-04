#!/bin/bash

# Student Unit: CSI6203
# Student Name: Yuhang Yang
# Student Number: 10513184

function getprop
{
    yh_word_count=$(cat ${1} | wc -w) # Get word count through CAT from user input($1).
    yh_file_size=$(du -bk ${1} | grep -o '^[0-9]*') # Get the number of bytes in the file(K as the unit) while using grep to extract only the number.
    yh_last_modified_date=$(date "+%d-%m-%Y %H:%M:%S") # Give expected date format.
    echo "The file ${1} contains ${yh_word_count} words and is ${yh_file_size}K in size and was last modified ${yh_last_modified_date}" 
}

read -p 'Please enter a name of a file: ' yh_filename
getprop "${yh_filename}" # Call function