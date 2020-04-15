#! /bin/bash

function generate_random {
    # generate random numeric string with given length
    random_string=$(cat /dev/urandom | tr -dc '0-9' | fold -w $1 | head -n 1)
}

function check_if_error_occured {
    # create a signal to abort operation if some kind of error occured
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
no_of_files=0
current_file=""
random_string=0
random_filename=""
does_file_exist=1
abort_pending_operation=0


while [ 0 ]
do
    ### CREATING A FILE
    generate_random $filename_length    # generowanie nazwy i sciezki do pliku
    random_filename=$random_string
    current_file=${path}${random_filename}
    
    does_file_exist=$(ls $path | grep -x "$random_filename" | wc -l)
    
    if [ $does_file_exist -ne 0 ]
    then
        continue
    fi
    
    touch $current_file
    check_if_error_occured      # jesli byl blad podczas tworzenia pustego pliku
    if [ $abort_pending_operation -ne 0 ]; then break; fi
    no_of_files=$(( $no_of_files+1 ))     # jesli nie bylo bledu, to plik powstal, wiec go liczymy
    
    ### FILLING UP THE FILE
    line_count=0
    while [ $line_count -le $max_lines ]
    do
        generate_random $line_length
        random_line=$random_string
        
        echo $random_line >> $current_file
        check_if_error_occured      # jesli brakuje miejsca na kolejne linie
        if [ $abort_pending_operation -ne 0 ]; then break; fi
        line_count=$(( $line_count+1 ))     # jesli nie bylo bledu, to linia zostala dopisana
    done
    if [ $abort_pending_operation -ne 0 ]; then break; fi
done

### podsumowanie
no_of_full_files=$(( $no_of_files-1 ))      # liczba w pelni wypelnionych plikow
approx_no_of_chars=$(( $line_count*$line_length + $no_of_full_files*$max_chars_in_file ))

echo
echo "W lokalizacji utworzono $no_of_files plikow oraz co najmniej $approx_no_of_chars znakow liczbowych."
echo



