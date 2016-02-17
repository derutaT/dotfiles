export LANG=ja_JP.UTF-8

## 履歴の保存先
HISTFILE=$HOME/.zsh-history
## メモリに展開する履歴の数
HISTSIZE=100000
## 保存する履歴の数
SAVEHIST=100000
## Behavior of Storing History
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# History Search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# setup local settings
for file in ~/.local/*.sh
do . $file
done

# setup peco functions
for file in ~/.peco/*.sh
do . $file
done

# load alias settings
for file in ~/.alias/*
do . $file
done
