# Initialization for all *interactive* shells
# (As opposed to shell scripts)

# Activate auto completion
autoload -Uz compinit && compinit

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# Set up shell prompt
PROMPT='%F{red}[%1~ ($vcs_info_msg_0_)]%#%f '
# Right hand timestamp
RPROMPT='%F{red}%D %*%f'

# Set up aliases
alias unp='unpushed --walk --tracked --remote /proj'
alias emacs='emacsclient -c'
alias port='echo "You mean brew."'
alias ows='open /Applications/Xcode.app *.xcworkspace'
alias opr='open /Applications/Xcode.app *.xcodeproj'
alias bows='open /Applications/Xcode-beta.app *.xcworkspace'
alias bopr='open /Applications/Xcode-beta.app *.xcodeproj'

export CLICOLOR=1
