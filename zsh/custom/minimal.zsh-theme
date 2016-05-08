autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%F{4}[%b]%{${reset_color}%} "

precmd() {
    vcs_info
}

setopt prompt_subst
PROMPT=$'
 %F{160}%~%{${reset_color}%} $vcs_info_msg_0_=> '

