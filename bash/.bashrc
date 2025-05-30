# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
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

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  #alias grep='grep --color=auto'
  #alias fgrep='fgrep --color=auto'
  #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias lh='ls -lah'
alias l='ls -CF'
alias h='hx'
alias k='kak'
alias e='emacs'
alias em='emacs -nw'

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#add neofetch on startup
# salut
# neofetch
#figlet -c -f ~/.local/share/fonts/figlet-fonts/3d.flf "debian" | lolcat
#pokemon-colorscripts -r

#custom session-----------------------------------------------------------------------
# PS1='\[\033[01;32m\]┌──${debian_chroot:+($debian_chroot)}(\[\033[01;36m\]\u\[\033[01;34m\]@\[\033[01;36m\]\h\[\033[01;32m\])-[\[\033[01;34m\]\w\[\033[01;32m\]]\n└─\[\033[00m\]\$ '
# PS1='$(if [[ $? == 0 ]]; then echo "\[\033[01;32m\]\342\234\223"; else echo "\[\033[01;31m\]\342\234\227"; fi) \[\033[01;31m\]\u\[\033[01;34m\]\[\033[1;33m\]@\[\033[01;36m\] \w $ \[\033[00m\]'
# Gruvbox Dark Colors
GruvboxRed='\[\e[38;5;167m\]'        # Soft Red
GruvboxGreen='\[\e[38;5;142m\]'      # Soft Green
GruvboxYellow='\[\e[38;5;214m\]'     # Soft Yellow
GruvboxBlue='\[\e[38;5;109m\]'       # Soft Blue
GruvboxPurple='\[\e[38;5;175m\]'     # Soft Purple
GruvboxAqua='\[\e[38;5;108m\]'       # Soft Aqua
GruvboxBackground='\[\e[48;5;235m\]' # Background (if needed)
NC='\[\e[0m\]'                       # No Color / Reset

parse_git_branch() {
             git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\n\[\e[1;33m\](\t)\[\e[m\] \[\e[1;36m\][ \u |\[\e[m\] \[\e[1;32m\W\[\e[m\] \[\e[1;36m\]]\[\e[m\] $(parse_git_branch)\n> '
#PS1="${GruvboxRed}[ ${GruvboxGreen}\u${GruvboxYellow}@${GruvboxBlue}\h${GruvboxPurple} ]${GruvboxAqua}:${GruvboxYellow} \W${NC} \\$ "
#PS1="\n\[\e[0;34m\]┌─[\[\e[1;36m\u\e[0;34m\]]──[\e[1;37m\W\e[0;34m]──[\[\e[1;36m\]${HOSTNAME%%.*}\[\e[0;34m\]]\[\e[1;35m\]: \$\[\e[0;34m\]\n\[\e[0;34m\]└────╼ \[\e[1;35m\]>> \[\e[00;00m\]"

# PS1="${Red}[ ${Blue}\u@\h${Red} ]${NC}: ${Red}\w${NC} \\$ "
##PS1

# end custom------------------------------------------------------------------------------------------------------------------

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="/usr/bin:$PATH"
# alias ls='lsd'
alias n='nvim'
alias v='vim'
alias nconf='cd ~/.config/nvim/'
alias zellij='~/./zellij'
alias list='apt list --upgradable'
alias eww='~/eww/target/release/eww'
alias cw='~/.config/chadwm/scripts/./change_wallpaper.sh'
alias con='nmtui-connect'
alias zdl='~/Downloads/ZdlEngine/./zdl'
alias music='tmux new-session -s $$ "tmux source-file ~/.ncmpcpp/tsession"'
alias bar='~/dwm-6.5/bar.sh'
alias chadfetch='~/.config/chadwm/scripts/./fetch'
alias tjournal='~/unixporn-material/tjournal'
export PATH="$HOME/.local/kitty.app/bin:$PATH"
# alias icat="kitten icat"
# _trap_exit() { tmux kill-session -t $$; }
PATH=~/.console-ninja/.bin:$PATH
PROMPT_DIRTRIM=1

export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
. "$HOME/.cargo/env"
# export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

#-------starship
eval "$(starship init bash)"
export PATH=$PATH:/home/fauzy/.nvm/versions/node/v20.17.0/bin
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
#export PATH="$HOME/.local/bin:$PATH"
#export PROMPT_COMMAND=""
# export PATH=$PATH:/home/fauzy/.nvm/versions/node/v20.17.0/bin
export PATH="$HOME/.local/bin:$PATH"
# export PATH="$HOME/myenv/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH=$PATH:~/.eww/target/release
export PATH=$PATH:~/.local/bin
export WINEPREFIX=~/.wine
export WINEARCH=win64
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$HOME/.spicetify:$PATH"
# export DISPLAY=$(echo $DISPLAY)
# export MANPAGER="vim -M +MANPAGER -"
export EDITOR=vim
alias seamonkey='/home/fauzy/Downloads/seamonkey/seamonkey'
alias palemoon='/home/fauzy/Downloads/Palemoon/palemoon/palemoon'
# alias notify-send="herbe"


# fnm
FNM_PATH="/home/fauzy/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
export PATH=$PATH:/opt/zen
export LD_LIBRARY_PATH=/home/fauzy/Downloads/icecat/icecat:$LD_LIBRARY_PATH
export PATH="$HOME/window-manager/squash:$PATH"

export PATH=$PATH:/home/fauzy/.spicetify
export PATH=$PATH:/usr/local/go/bin
export QT_QPA_PLATFORMTHEME=qt5ct

alias templeos=
