filepath=`readlink -f $1`
dir=${filepath%/*}
filename=${filepath##*/}
newdir=$dir/${filename%%-*}
# extract file into dir 
unzip $filepath -d $newdir
# get dirname into clipboard
echo $newdir | xsel -b -i
