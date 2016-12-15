# vim open with peco selected
function peco-find-vim () {
  local FILES=''
  if [ $(git rev-parse --is-inside-work-tree 2> /dev/null) = 'true' ]; then
    FILES=$(echo $(git ls-files -o --exclude-standard) $(git ls-files) | tr ' ' '\n' | peco --query "$*" | tr '\n' ' ')
  else
    FILES=$(find . | peco --query "$*" | tr '\n' ' ')
  fi
  if [ -n "$FILES" ]; then
    vim $(echo $FILES)
  fi
}
alias v='peco-find-vim'
