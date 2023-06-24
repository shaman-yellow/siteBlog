
# 浙江温州瑞安莘塍街道仙甲季老干部宿舍第三单元301室
# 杭州市滨江区滨文路辅路与信诚南路交叉口龙湖冠寓浦沿冠一店1-1205
# 2010年9月-2013年6月 浙江温州瑞安高楼宁益乡学校
# 2013年9月-2016年6月 浙江温州瑞安第四中学
# 2016年9月-2020年6月 浙江中医药大学滨江学院
# 2020年9月-2023年6月 浙江中医药大学

## ------------------------------------- 
# sudo chmod u+s `which fusermount`

function fastpush () {
  git add -A
  git commit -m "`date`"
  git push origin master
}

## work group
# /usr/share/texlive/texmf-dist
alias h=cd\ ~/outline/lixiao/
alias hs=cd\ ~/legend/story/re_rise/chapter_previous
alias h0=cd\ ~/legend/story/essay/
alias i=cd\ ~/utils.tool/inst/extdata\;ls
alias g=cd\ ~/bash_script/terminal_groups\;ls
alias coo=cd\ ~/outline/others/
alias u=cd\ ~/utils.tool/R\;ls
alias v=cd\ ~/Documents/WeChat\\\ Files
alias r=cd\ /mnt/data/wizard/Documents/article/reports\;ls
alias cwd=echo\ `pwd`\ \|\ xsel\ \-b\ \-i

function c() {
  cd $1
  ls
}
## ------------------------------------- 

article_mcnebula2=/mnt/data/wizard/Documents/article/MCnebula2
docs=~/MCnebula2/content/en/docs
alias m2pdf=R\ CMD\ Rd2pdf\ --title="MCnebula2"\ -o\ reference.pdf\ .

alias panmd=pandoc\ --track-changes=all\ --strip-comments

## https://tableconvert.com API key: x5fiZX6L1yJtmBS1A6LIImVBorjd7c5f
## git@github.com:Cao-lab-zcmu/MCnebula2.git
# https://cao-lab-zcmu.github.io/MCnebula2/
# qqmail empower ozathvqzvmyfeiid
# Aftereffect112
# aftereffect112
# MCnebula：基于非靶向 LC-MS/MS 技术的化学聚类可视化分析策略快速解析中药复杂化学成分

# 2020年 获药学院二等奖学金
# 2021年 获国家奖学金
# 2022年 获药学院一等奖学金
# 2023年 获药学院三等奖学金

set -o vi
## alias
relive() {
  rm -r ~/MCnebula2/content/en/*/*/{index_files,index.html,index.md}
}

bash ~/bash_script/wallpaper.sh

alias cd.=cd\ ..
alias cd..=cd\ ../..
alias cd...=cd\ ../../..
alias t=cd\ /mnt/data/wizard/Documents/article/thesis
alias tmp=cd\ ~/operation/tmp
alias o=xdg-open
alias lh=ls\ --size\ -h
alias ccc=cd\ ~/legend/story/re_rise
alias cvim=cd\ ~/.vim/after/ftplugin
alias gett=xsel\ \-b\ \-i
alias send=google-chrome\ https://send-anywhere.com/
alias deepl=google-chrome\ https://www.deepl.com/translator
alias fy=trans
alias fyz=trans\ :zh
alias cwe=cd\ "~/.wine/drive_c/users/echo/My\ Documents/WeChat\ Files/wxid_fehx3syoq76312/FileStorage/MsgAttach/9e20f478899dc29eb19741386f9343c8/File"
alias msc=bash\ ~/bash_script/msconvert_pre.sh
alias unjar=bash\ ~/bash_script/unjar.sh
alias mvn_create=bash\ ~/bash_script/mvn_create.sh
alias geny=sudo\ /opt/genymobile/genymotion/genymotion
alias pandoc_track=pandoc\ --track-changes\=all
alias ncm2flac=python3\ ~/Music/pyNCMDUMP/ncmdump.py
## https://cao-lab-zcmu.github.io/VIgnette/
# export PATH=$PATH:/opt/genymobile/genymotion/
export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=$JAVA_HOME/bin:$PATH
export INSTALL4J_JAVA_HOME=/usr/lib/jvm/java-1.18.0-openjdk-amd64
# export http_proxy=http://127.0.0.1:8889
# export https_proxy=http://127.0.0.1:8889
# export all_proxy=socks5://127.0.0.1:1089
mymail="shaman.yellow@foxmail.com"
office="202011114011074@zcmu.edu.cn"
github_pass=shaman.wizard000
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

PS1='\e[32m\A\e[1m\e[31m [\h] \e[34m\u@172.31.130.40\e[35m \w\e[0m\n\$  '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# source "$HOME/.fast_cd/fast_cd_menu.sh"
