#!/usr/bin/bash
if [ $# -ne 2 ]; then
  echo provide dir and link pls
  exit 1
fi

pagesfromartist='todo!'

galleriesfrompage='sa<space>href<ret><a-semicolon>md<percent><a-d><a-R>l\i<ret><esc>ged<percent><a-s><a-k>galleries<ret>d<percent><a-d><a-R><a-k>class<ret><a-d><percent><a-s><a-/>html<ret><a-i>Qd<a-h><a-l>R'

imagesfromgallery='sclass="portrait<space>thumb<ret><a-/>img<space>src<ret>lll<a-i>Qd<percent><a-d><a-R>li<ret>,<backspace><esc>,d'

url=$2
dir=$1

# wget -O - --user-agent="Mozilla" $url  |
# kak -f $pagesfromartist | !next without url as it should pass the urls
# TODO there seems to be a bug, not all images or not all galleries are being fetched
wget -O - --user-agent="Mozilla" $url  |
kak -f $galleriesfrompage              |
uniq                                   |
xargs wget -O - --user-agent="Mozilla" |
kak -f $imagesfromgallery              |
xargs wget -P $dir
