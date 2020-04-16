#! /bin/bash

### remember to give path! 
path="/PATH/TO/PARTITION_OR_DIRECTORY"   
###

random_filename=""      #

# performing a loop until error occured
while [ 0 ]     
do
    random_filename=$(cat /dev/urandom | tr -dc '0-9' | fold -w 16 | head -n 1)   # create random filename
    
    touch ${path}${random_filename}   # touch or create an empty file with given random name
    
    if [ $? -ne 0 ]     # check touch's error code
    then
        break           # break while-loop if there were writing (touching) error
    fi
    
done


# SUMMARY
no_of_files=$(ls $path | wc -l)     # counting up ALL files in directory

echo
echo "There are $no_of_files files in the directory"
echo
