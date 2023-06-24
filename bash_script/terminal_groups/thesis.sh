
dir="/mnt/data/wizard/Documents/article/thesis/"
gnome-terminal --tab -t "Thesis" --working-directory=$dir -- vim index.Rmd
gnome-terminal --tab -t "Script" --working-directory=$dir -- vim post_modify.R
