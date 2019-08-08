#!/bin/bash

# check for mikro.txt
if [ ! -f mikro.txt ]; then
    touch mikro.txt
fi
# create temporary file
file=$(mktemp)
data=$(mktemp)
# write timestamp
date -u +"%F %T" > $file
# edit with vim (using custom vimrc)
vim -n -u ./.vimrc $data
# merge files
cat $data >> $file
rm $data
# insert space
echo "" >> $file
# append past
cat mikro.txt >> $file
# replace file
mv $file mikro.txt
# run push task
bash push.sh
