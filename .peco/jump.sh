function jump-and-tmux-rename-window() {
  j "$@"
  tmux rename-window ${PWD:t}
}
alias j='jump-and-tmux-rename-window'

