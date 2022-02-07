#!/usr/bin/bash
if [ $# -ne 2 ]; then
  echo provide dir and link pls
  exit 1
fi

command=\
'sfileThumb<ret>/href....i<ret><semicolon>t"d'\
'<percent><a-d><a-R>li<ret>,<backspace><esc>,d'

wget -q -O - $2 |
kak -f $command |
xargs wget -P $1
