## !/bin/bash
dir="/home/echo/outline/mc.test/evaluation_workflow"
dir2="/tmp/RtmphsJYMR/temp_data"
dir3="/home/echo/utils.tool/R"
if [ -f $dir2 ]
then
  echo $dir2 exists
else
  mkdir --parents $dir2
  cp ~/tmp_backup/R/evaluation/* -r -t $dir2
fi

xdg-open ~/exMCnebula2/inst/extdata/evaluation.tar.gz
gnome-terminal --tab -t "Evaluation Script" --working-directory=$dir -- vim evaluation_workflow.R
gnome-terminal --tab -t "Temp dir" --working-directory=$dir2 -- bash -c "ls; bash"
gnome-terminal -t "Simutate" --working-directory=$dir3 -- vim simulate_and_evaluate.R
