
dir="/mnt/data/wizard/Documents/article/MCnebula2"
gnome-terminal --tab -t "Article" --working-directory=$dir -- vim mcnebula3.7_ac.md
gnome-terminal --tab -t "Reply" --working-directory=$dir \
  -- vim -p ac_comment.md ac_comment_reply.Rmd convertReply3.7_to_3.8.R
gnome-terminal --tab --working-directory=$dir -- bash -c "ls; bash"
