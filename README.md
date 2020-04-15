# filler
Simple bash scripts that fills up memories' available (and visible in system) space.

### but why?
Just for fun. I wanted to introduce myself into bash scripts. After watching [that Computerphile film](https://www.youtube.com/watch?v=kiTTAbeqQKY) I finally had an idea to make my first bash script.

### how it works?
There are two scripts:
1) one makes a lot of empty files in given path. Files have random numeric names with the same length. After recieving an error (of any kind), script stops.
2) another one makes a lot of text files, filled up with random data. I wanted that files to be not-that-big, to have ability to open them (with no reason, I just wanted that).

There are problems related to exact scripts:
1) it is very likely that first script would run int an error without filling up in space, and there are some reasons:
- not enoguh i-nodes in ext partition
- your FAT partition will run out of disk cluster.
- maybe something else?
But filling up space with empty files succeeded in 7 MiB UDF partition though.
2) text-files-generating-script runs extreeeeemly slow. It is so slow. It is extra slow. It's not practical at all. 

### summary
I had some fun, and now I have ability to show it to you.

If you want to randomize/shred data on disks, please use system tools or [ATA Secure Erase](https://ata.wiki.kernel.org/index.php/ATA_Secure_Erase) or maybe something else (that have good reputation).