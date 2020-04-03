#! /bin/bash

path="/run/media/bartek/udf_experiments/"
rand_name=0
no_of_files=0

while [ 0 ]
do
    rand_name=$(cat /dev/urandom | tr -dc '0-9' | fold -w 16 | head -n 1)
    touch ${path}${rand_name}
    # sprawdzenie czy plik rzeczywiscie zostal utwrzony, aby sprawdzic czy dysk jest juz przepelniony
done

# podsumowanie - ile plikow utworzono

