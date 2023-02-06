# Brief: This is the bash-completion script for command: helpdoc

_complete(){
  local opts='-e -d -a -u -v -h'
  if (( COMP_CWORD == 1 )); then
    COMPREPLY=( $(compgen -c -W "${opts}" "${2}") )
  elif (( COMP_CWORD == 2 )) && [[ "${COMP_WORDS[1]}" == '-e' ]]; then
    COMPREPLY=( $(compgen -f "${2}") )
  elif [[ "${COMP_WORDS[1]}" != '-h' ]]; then
    COMPREPLY=( $(compgen -c "${2}") )
  fi
}

complete -F _complete helpdoc
