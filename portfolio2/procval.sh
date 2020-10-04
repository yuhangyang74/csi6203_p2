#!/bin/bash

# Student Unit: CSI6203
# Student Name: Yuhang Yang
# Student Number: 10513184

yh_values='' # Setting an empty value

while read;do
    yh_values="${yh_values} ${REPLY}" # Add each line to the VALUES variable with spaces
done < values.txt

yh_values=(${yh_values}) # Turn yh_values to an array.

for((i=0;i<${#yh_values[@]};++i)); do # Traverse this array

    echo ${yh_values[${i}]} | grep -qE '^[[:digit:]]+$' # Whether to match the cell content is numbers only.
    if [[ ${?} = 0 ]];then # Judge based on the value return to grep. 
        echo "${yh_values[${i}]} is comprised of numbers only"
    fi
    
    echo ${yh_values[${i}]} | grep -qE '^[[:alpha:]]+$' # Whether to match the cell content is letters only.
    if [[ ${?} = 0 ]];then
        echo "${yh_values[${i}]} is comprised of letters only"
    fi
    
    echo ${yh_values[${i}]} | grep -qE '[[:digit:]]+' && echo ${yh_values[${i}]} | grep -qE '[[:alpha:]]+' # Whether to match the cell content is number and letter.
    if [[ ${?} = 0 ]];then
        echo "${yh_values[${i}]} is comprised of numbers and letters"
    fi
done

exit 0