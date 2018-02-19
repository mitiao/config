#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ..='cd ..'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls --color -ahX --group-directories-first'
alias cp='rsync -avP'

alias S='sudo pacman -S'
alias Ss='sudo pacman -Ss'
alias Sy='sudo pacman -Sy'
alias Su='sudo pacman -Su'
alias Scc='sudo pacman -Scc'
alias U='sudo pacman -U'
alias R='sudo pacman -R'
alias Qs='sudo pacman -Qs'
alias Ql='sudo pacman -Ql'

alias grep='grep --color=auto'

alias qcow2create='qemu-img create -f qcow2'
alias qemukvm2048='qemu-system-x86_64 -m 2048 -enable-kvm'
alias qemukvmbr='qemu-system-x86_64 -m 2048 -enable-kvm -net nic -net bridge,br=br0'

alias aria2c='aria2c -x 5'
alias http='python -m http.server'

PS1='[\u@\h \W]\$ '

export GOPATH=$HOME/Play/gogogo
export PATH="$PATH:/usr/bin/site_perl:/home/mitiao/.gem/ruby/2.5.0/bin:$GOPATH/bin"

export PS1="\[\e[36;1m\]\u\[\e[0m\]@\[\e[33;1m\]\h\[\e[0m\]:\[\e[31;1m\]\w\[\e[0m\]\n\$ "
export EDITOR="vim"
complete -cf sudo

. /home/mitiao/Git_repos/z/z.sh
