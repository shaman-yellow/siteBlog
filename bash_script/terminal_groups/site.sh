
dir="/home/echo/outline/mc.test/"
dir2="/home/echo/MCnebula2/"
gnome-terminal --tab -t "Script" --working-directory=$dir -- vim site_mcnebula2.R
gnome-terminal --tab -t "Site" --working-directory=$dir2 -- bash -c 'ls; exec bash'
