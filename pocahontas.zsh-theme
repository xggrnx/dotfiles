if [[ $UID -eq 0 ]]; then
   local user_host="%{$terminfo[no_bold]$fg[red]%}%n@%m%{$reset_color%}"
else
   local user_host="%{$terminfo[no_bold]$fg[yellow]%}%n@%m%{$reset_color%}"
fi
local current_dir="%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}"

PROMPT='$(virtualenv_prompt_info)${user_host}%{$reset_color%}${current_dir}%{$fg[yellow]%}➜%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
