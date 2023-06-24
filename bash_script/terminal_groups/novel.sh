
dir="/home/echo/outline/blog"
dir2="/home/echo/siteBlog/content/en/docs/novel/"
gnome-terminal --tab -t "Script" --working-directory=$dir -- vim site_blog.R
gnome-terminal --tab -t "Site" --working-directory=$dir2 -- bash -c 'ls; exec bash'
