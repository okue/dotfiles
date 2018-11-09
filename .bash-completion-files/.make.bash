
_make()
{
  local first=`ls`
  if [ -f ./Makefile ]; then
    first=`cat Makefile | grep -oE '^[^\$#= ]+:' | grep -vE '(%|.PHONY)' | sed 's/://'`
  fi
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]} # previous argument
  case "$COMP_CWORD" in
    1) COMPREPLY=( $(compgen -W "$first" -- $cur) ) ;;
    *) COMPREPLY=( $(compgen -W "$(ls)"  -- $cur) ) ;;
  esac
}

complete -o default -F _make  make
