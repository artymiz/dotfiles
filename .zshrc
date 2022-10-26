#     _____    _
#  # |__  /___| |__  _ __ ___
#  #   / // __| '_ \| '__/ __|
#  #  / /_\__ \ | | | | | (__
#  # /____|___/_| |_|_|  \___|
export VISUAL=nvim
export EDITOR=$VISUAL

autoload -Uz compinit && compinit
fpath=(path/to/zsh-completions/src $fpath)

# =========== Powerlevel Config ============
# 
# Font mode for powerlevel9k
POWERLEVEL9K_MODE=nerdfont-complete
 
# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable_joined vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status)
 
# Prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=$''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=$' \uf101 '
 
# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'%F{007}\uf054'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'%F{007}\uf053'

# Dir colours
POWERLEVEL9K_DIR_HOME_BACKGROUND='clear'
POWERLEVEL9K_DIR_HOME_FOREGROUND='004'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='clear'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='004'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='clear'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='004'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DIR_ETC_BACKGROUND='clear'
POWERLEVEL9K_ETC_ICON=$'%F{012}\uf013'
POWERLEVEL9K_HOME_ICON=$'%F{012}\ue617'
POWERLEVEL9K_HOME_SUB_ICON=$'%F{012}\uf07c'
POWERLEVEL9K_FOLDER_ICON=$'%F{012}\uf115'

# VCS icons
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d2 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113 '
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=$'\uf296 '
POWERLEVEL9K_VCS_BRANCH_ICON=$''
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='clear'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='003'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='clear'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='006'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='clear'

# VCS CONFIG
POWERLEVEL9K_VCS_SHOW_CHANGESET=false

# Status
POWERLEVEL9K_OK_ICON=$'\uf00c'
POWERLEVEL9K_FAIL_ICON=$'\uf00d'
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_BACKGROUND='clear'
POWERLEVEL9K_STATUS_OK_BACKGROUND='clear'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='clear'
POWERLEVEL9K_CARRIAGE_RETURN_ICON="\uf071"

# Ram
# POWERLEVEL9K_RAM_BACKGROUND='clear'
# POWERLEVEL9K_RAM_FOREGROUND='003'
# POWERLEVEL9K_RAM_ICON=$'\uf490'

# Execution time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='012'

# ----------- Powerlevel Config ------------

source  ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# if neovim is installed from source with installation home bound to ~/neovim/bin
# this line may need to be uncommented
# export PATH="$HOME/neovim/bin:$PATH"
alias v='nvim'

alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias py='python3'
alias pip='pip3'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/arty/.sdkman"
[[ -s "/home/arty/.sdkman/bin/sdkman-init.sh" ]] && source "/home/arty/.sdkman/bin/sdkman-init.sh"
export PATH="/home/arty/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

PATH=$PATH:/usr/bin:/opt
