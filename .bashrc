export EDITOR=nano

[ ! "$UID" = "0" ] && archey3
[  "$UID" = "0" ] && archey3 -c red

# User PS1
PS1="\[\e[30;1m\]┌─[\[\e[0;34m\u\e[30;1m\]]──[\\e[0;35m\]${HOSTNAME%%.*}\[\e[30;1m\]]\[\e[01;32m\]:\w\[\e[30;1m\]\n\[\e[30;1m\]└──\[\e[01;34m\]>>\[\e[0m\]"
# Root PS1
#PS1="\[\e[30;1m\]┌─[\[\e[0;31m\u\e[30;1m\]]──[\\e[0;35m\]${HOSTNAME%%.*}\[\e[30;1m\]]\[\e[01;32m\]:\w\[\e[30;1m\]\n\[\e[30;1m\]└──\[\e[01;31m\]>>\[\e[0m\]"

alias ls='ls --color=auto'

# Alias added to extract archives from bashrc helpers
extract() {
 local e=0 i c
 for i; do
   if [ -f $i && -r $i ]; then
       c=
       case $i in
         *.tar.bz2) c='tar xjf'    ;;
         *.tar.gz)  c='tar xzf'    ;;
         *.bz2)     c='bunzip2'    ;;
         *.gz)      c='gunzip'     ;;
         *.tar)     c='tar xf'     ;;
         *.tbz2)    c='tar xjf'    ;;
         *.tgz)     c='tar xzf'    ;;
         *.7z)      c='7z x'       ;;
         *.Z)       c='uncompress' ;;
         *.exe)     c='cabextract' ;;
         *.rar)     c='unrar x'    ;;
         *.xz)      c='unxz'       ;;
         *.zip)     c='unzip'      ;;
         *)     echo "$0: cannot extract \`$i': Unrecognized file extension" >&2; e=1 ;;
       esac
       [ $c ] && command $c "$i"
   else
       echo "$0: cannot extract \`$i': File is unreadable" >&2; e=2
   fi
 done
 return $e
}
