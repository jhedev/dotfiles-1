# =====================================
# Antigen config
# =====================================

# Source Antigen
source ~/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Bundle some oh-my-zsh plugins
antigen bundle git

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Use Pure prompt
antigen bundle mafredri/zsh-async
antigen bundle colepeters/pure

# That's a wrap!
antigen apply

# =====================================
# Other orders of business
# =====================================

# Source aliases
source ~/.aliases.zsh

# Source functions
source ~/.functions.zsh

# Source secrets
source ~/.secrets

# Override rm -i alias which makes rm prompt for every action
alias rm='nocorrect rm'

# Git
__git_files () {
  _wanted files expl 'local files' _files
}
# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'

export NVM_DIR="/Users/cole/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# tab completion for NVM
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
