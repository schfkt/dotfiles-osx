autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "[%b] "

precmd() {
    vcs_info
}

setopt prompt_subst
PROMPT=$'

 %~ [%D %*] $vcs_info_msg_0_
 %# '

