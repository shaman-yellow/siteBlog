## !/bin/bash
dir="/home/echo/outline/mc.test/serum_workflow"
dir2="/tmp/RtmpQV1RlL/temp_data"
if [ -f $dir2 ]
then
  echo $dir2 exists
else
  mkdir --parents $dir2
  cp ~/tmp_backup/R/serum/temp_data/* -r -t $dir2
fi

gnome-terminal --tab -t "Evaluation Script" --working-directory=$dir -- vim serum_workflow.R
gnome-terminal --tab -t "Temp dir" --working-directory=$dir2 -- bash -c "ls; bash"
