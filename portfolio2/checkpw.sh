#!/bin/bash

# Student Unit: CSI6203
# Student Name: Yuhang Yang
# Student Number: 10513184

# Starting from the second column.
# The length of the second column is greater than or equal to eight characters.
# The second column has numbers and the second column has capital letters
# If it meet print second value - meets... Else print - does NOT meet...

awk 'FNR!=1{if(length($2)>=8 && $2 ~ /[0-9]/ && $2 ~ /[A-Z]/) print $2" - meets password strength requirements";
else print $2" - does NOT meet password strength requirements"}' usrpwords.txt
