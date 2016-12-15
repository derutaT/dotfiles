function peco-branch () {
    local branch=$(git branch -a | peco | tr -d ' ' | tr -d '*' | sed -e 's#remotes/origin/##g' | tr '\n' ' ')
    if [ -n "$branch" ]; then
      if [ -n "$LBUFFER" ]; then
        local new_left="${LBUFFER%\ } $branch"
      else
        local new_left="$branch"
      fi
      BUFFER=${new_left}${RBUFFER}
      CURSOR=${#new_left}
    fi
}
zle -N peco-branch
bindkey '^g^b' peco-branch # C-x C-b でブランチ選択
