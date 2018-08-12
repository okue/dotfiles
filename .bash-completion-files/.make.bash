
_make()
{
  local tmp=`ls`
  if [ -f ./Makefile ]; then
    tmp=`cat Makefile | grep -E '^[^\$#= ]+:' | grep -v '^\t'`
  fi
  local tmp2=${tmp//:/}
  local first=${tmp2//$/}
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]} # previous argument
  case "$COMP_CWORD" in
    1) COMPREPLY=( $(compgen -W "$first" -- $cur) ) ;;
    *) COMPREPLY=( $(compgen -W "$(ls)"  -- $cur) ) ;;
  esac
}

complete -o default -F _make  make
