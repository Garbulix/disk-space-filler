#! /bin/bash

function generate_random {
    # generate random numeric string with given length and save it in variable
    random_string=$(cat /dev/urandom | tr -dc '0-9' | fold -w $1 | head -n 1)
}

function check_if_error_occured {
    # create a confirmation that some kind of error occured
    if [ $? -ne 0 ]
    then 
        abort_pending_operation=1
    fi
}

### remember to give path! 
path="/PATH/TO/PARTITION_OR_DIRECTORY"  
###

### variables that shouldn't be changed later
line_length=500
max_lines=100
filename_length=16
max_chars_in_file=$(( $line_length*$max_lines ))


### variables that will change later
current_file=""
random_string=0
random_filename=""
# "booleans":
does_file_exist=1
abort_pending_operation=0
# vars for summary:
no_of_files=0
approx_number_of_chars=0
no_of_full_files=0

# performing a loop until error occured
while [ 0 ]
do
    ### CREATING A FILE
    generate_random $filename_length    # generating name for new file
    random_filename=$random_string      
    current_file=${path}${random_filename}
    
    does_file_exist=$(ls $path | grep -x "$random_filename" | wc -l)
    
    if [ $does_file_exist -ne 0 ]
    then
        continue    # continue to next iteration to generate new name, because that is used
    fi
    
    touch $current_file
    
    check_if_error_occured              # check error when creating file
    if [ $abort_pending_operation -ne 0 ]
    then
        break
    fi
    
    no_of_files=$(( $no_of_files+1 ))   # there was no errors, so we can count the file
    
    ### FILLING UP THE FILE
    line_count=0
    while [ $line_count -le $max_lines ]
    do
        generate_random $line_length
        random_line=$random_string
        
        echo $random_line >> $current_file
        check_if_error_occured          # if there is no space left for another line
        
        if [ $abort_pending_operation -ne 0 ]
        then
            break
        fi
        
        line_count=$(( $line_count+1 ))     # count line, because there was no errors
    done
    if [ $abort_pending_operation -ne 0 ]; then break; fi
done

### SUMMARY
no_of_full_files=$(( $no_of_files-1 ))  # last file may not be full
approx_no_of_chars=$(( $line_count*$line_length + $no_of_full_files*$max_chars_in_file ))

echo
echo "There are $no_of_files new files with at least $approx_no_of_chars of characters in them in the directory."
echo



