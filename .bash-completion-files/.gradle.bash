_gradle()
{
    local tasks="clean build test assemble generateProto bootJar bootRun detekt ktlintFormat deployP compileK integrationTest"
    local options="-p --info --debug --dry-run"
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]} # previous argument
    case "$COMP_CWORD" in
        1) COMPREPLY=( $(compgen -W "$tasks $options" -- $cur) ) ;;
        *)
            case $prev in
                -p) COMPREPLY=( $(compgen -d -- $cur) ) ;;
                *) COMPREPLY=( $(compgen -W "$tasks $options" -- $cur) ) ;;
            esac
    esac
}

complete -o default -F _gradle gradle
complete -o default -F _gradle gradlew
