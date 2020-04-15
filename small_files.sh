#! /bin/bash

### remember to give path! 
path="/PATH/TO/PARTITION_OR_DIRECTORY"   
###

random_filename=0     # zmienna do losowo tworzonych nazw

while [ 0 ]     # rob dopoki nie wystapi blad
do
    random_filename=$(cat /dev/urandom | tr -dc '0-9' | fold -w 16 | head -n 1)   # create random filename
    touch ${path}${random_filename}   # touch or create an empty file with given random name
    
    if [ $? -ne 0 ]     # check touch's error code
    then
        break   # break while loop if there were writing (touching) error
    fi
    
done


# writing a summary
no_of_files=$(ls $path | wc -l)

echo
echo "There are $no_of_files files in the directory"
echo
