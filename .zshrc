# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set path if required
#export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
export PATH="$PATH:$HOME/Tools/flutter/flutter_3.16.9/bin:$HOME/Tools/lazygit"

export EDITOR='nvim'
export CHROME_EXECUTABLE=/usr/bin/chromium

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc
alias sc="source $HOME/.zshrc"  # reload zsh configuration
alias vim="nvim"
alias vi="nvim"

# Set up the prompt - if you load Theme with zplugin as in this example, this will be overriden by the Theme. If you comment out the Theme in zplugins, this will be loaded.
#autoload -Uz promptinit
#promptinit
#prompt adam1            # see Zsh Prompt Theme below

# Use vi keybindings even if our EDITOR is set to vi
bindkey -v

setopt histignorealldups sharehistory

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# zplug - manage plugins
source ~/.zplug/init.zsh
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/asdf", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/gradle", from:oh-my-zsh
zplug "plugins/apt", from:oh-my-zsh
zplug "plugins/aliases", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"
zplug "jeffreytse/zsh-vi-mode"
#zplug "themes/robbyrussell", from:oh-my-zsh, as:theme   # Theme
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load 

# Set local aliases
MY_LOCAL_CONFIG=~/.my-local-config
if [[ -f $MY_LOCAL_CONFIG ]]; then
  source $MY_LOCAL_CONFIG
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export GNOME_KEYRING_CONTROL=$XDG_RUNTIME_DIR/keyring

# Start SSH agent if not running
if [ ! -S ~/.ssh/ssh-agent.sock ]; then
    eval "$(ssh-agent -s)" > /dev/null
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh-agent.sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.sock
