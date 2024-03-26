#!/usr/bin/env bash
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all base BASH functions
#
#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

#   mcd:   Makes new Dir and jumps inside
#   --------------------------------------------------------------------
#    mcd () { mkdir -p -- "$*" ; cd -- "$*" || exit ; }

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.
#           Example: mans mplayer codec
#   --------------------------------------------------------------------
#    mans () { man "$1" | grep -iC2 --color=always "$2" | less ; }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
#    showa () { /usr/bin/grep --color=always -i -a1 "$@" ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

#   quiet: mute output of a command
#   ------------------------------------------------------------
#    quiet () {
#        "$*" &> /dev/null &
#    }

#   lsgrep: search through directory contents with grep
#   ------------------------------------------------------------
#    lsgrep () { ls | grep "$*" ; }

#   banish-cookies: redirect .adobe and .macromedia files to /dev/null
#   ------------------------------------------------------------
#    banish-cookies () {
#      rm -r ~/.macromedia ~/.adobe
#      ln -s /dev/null ~/.adobe
#      ln -s /dev/null ~/.macromedia
#    }

#   show the n most used commands. defaults to 10
#   ------------------------------------------------------------
#    hstats() {
#      if [[ $# -lt 1 ]]; then
#        NUM=10
#      else
#        NUM=${1}
#      fi
#      history | awk '{print $2}' | sort | uniq -c | sort -rn | head -"$NUM"
#    }
#
#   -------------------------------
#   2.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

#zipf () { zip -r "$1".zip "$1" ; }           # zipf:         To create a ZIP archive of a folder

#   buf:  back up file with timestamp
#   ---------------------------------------------------------
#    buf () {
#      local filename filetime
#      filename=$1
#      filetime=$(date +%Y%m%d_%H%M%S)
#      cp -a "${filename}" "${filename}_${filetime}"
#    }
#
#   ---------------------------
#   3.  SEARCHING
#   ---------------------------

#ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
## shellcheck disable=SC2145
#ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
## shellcheck disable=SC2145
#ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string
#bigfind() {
#  if [[ $# -lt 1 ]]; then
#    echo_warn "Usage: bigfind DIRECTORY"
#    return
#  fi
#  du -a "$1" | sort -n -r | head -n 10
#}
#
#   ---------------------------
#   4.  PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
#    findPid () { lsof -t -c "$@" ; }

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
#    my_ps() { ps "$@" -u "$USER" -o pid,%cpu,%mem,start,time,bsdtime,command ; }

#   ---------------------------
#   5.  NETWORKING
#   ---------------------------

#   ips:  display all ip addresses for this host
#   -------------------------------------------------------------------
#    ips () {
#      if command -v ifconfig &>/dev/null
#      then
#        ifconfig | awk '/inet /{ print $2 }'
#      elif command -v ip &>/dev/null
#      then
#        ip addr | grep -oP 'inet \K[\d.]+'
#      else
#        echo "You don't have ifconfig or ip command installed!"
#      fi
#    }
#
#   down4me:  checks whether a website is down for you, or everybody
#   -------------------------------------------------------------------
#    down4me () {
#      curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g'
#    }

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
#    ii() {
#      echo -e "\\nYou are logged on ${red}$HOST"
#      echo -e "\\nAdditionnal information:$NC " ; uname -a
#      echo -e "\\n${red}Users logged on:$NC " ; w -h
#      echo -e "\\n${red}Current date :$NC " ; date
#      echo -e "\\n${red}Machine stats :$NC " ; uptime
#      echo -e "\\n${red}Public facing IP Address :$NC " ;myip
#      echo
#    }

#   ---------------------------------------
#   6.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------
#
#   batch_chmod: Batch chmod for all files & sub-directories in the current one
#   -------------------------------------------------------------------
#    batch_chmod() {
#      echo -ne "${echo_bold_blue}Applying 0755 permission for all directories..."
#      (find . -type d -print0 | xargs -0 chmod 0755) &
#      spinner
#      echo -ne "${echo_normal}"
#
#      echo -ne "${echo_bold_blue}Applying 0644 permission for all files..."
#      (find . -type f -print0 | xargs -0 chmod 0644) &
#      spinner
#      echo -ne "${echo_normal}"
#    }

#   usage: disk usage per directory, in Mac OS X and Linux
#   -------------------------------------------------------------------
#    usage () {
#      if [ "$(uname)" = "Linux" ]; then
#        if [ -n "$1" ]; then
#          du -h --max-depth=1 "$1"
#        else
#          du -h --max-depth=1
#        fi
#      fi
#    }

#httpHeaders () { /usr/bin/curl -I -L "$@" ; }             # httpHeaders:      Grabs headers from web page
#
#   httpDebug:  Download a web page and show info on what took time
#   -------------------------------------------------------------------
#    httpDebug () { /usr/bin/curl "$@" -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\\n" ; }

#   ---------------------------------------
#   X.  REMINDERS & NOTES
#   ---------------------------------------

#   remove_disk: spin down unneeded disk
#   ---------------------------------------
#   diskutil eject /dev/disk1s3

#   to change the password on an encrypted disk image:
#   ---------------------------------------
#   hdiutil chpass /path/to/the/diskimage

#   to mount a read-only disk image as read-write:
#   ---------------------------------------
#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

#   mounting a removable drive (of type msdos or hfs)
#   ---------------------------------------
#   mkdir /Volumes/Foo
#   ls /dev/disk*   to find out the device to use in the mount command)
#   mount -t msdos /dev/disk1s1 /Volumes/Foo
#   mount -t hfs /dev/disk1s1 /Volumes/Foo

#   to create a file of a given size: /usr/bin/hdiutil
#   ---------------------------------------
#   e.g.: hdiutil create -size 10m 10MB.dmg
#   the above create files that are almost all zeros - if random bytes are desired
#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat
