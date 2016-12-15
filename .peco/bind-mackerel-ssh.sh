# ssh mackrel hosts with peco
function mackerel-ssh() {
  APIKEY=$(ls ~/.mackerel | peco)
  cat ~/.mackerel/${APIKEY} | mackerel-hosts.sh | sort | peco | sed -e 's/  */ /g' | cut -d' ' -f2 | tmux-multi-pane-ssh.sh
}

zle -N mackerel-ssh
bindkey '^s^m' mackerel-ssh

