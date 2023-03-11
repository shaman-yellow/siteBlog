#!/bin/bash
wallpaperdir=/home/echo/Pictures/antique_white_583
 
randompic=`ls $wallpaperdir | shuf -n 1`
gsettings set org.gnome.desktop.background picture-uri file://$wallpaperdir/$randompic
