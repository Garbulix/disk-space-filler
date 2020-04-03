#! /bin/bash

path="/run/media/bartek/udf_experiments/"
superfilename="superfile.txt"
new_line=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

# touch ${path}${superfilename}
echo $new_line > ${path}"superfile.txt"

while [ 0 ]
do
    echo $new_line >> ${path}"superfile.txt"
    # sprawdzenie czy plik rzeczywiscie zostal utwrzony, aby sprawdzic czy dysk jest juz przepelniony
done

# podsumowanie - ile plikow utworzono

