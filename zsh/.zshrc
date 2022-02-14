#Terminal Charm
fortune

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
export KEYTIMEOUT=1

zstyle :compinstall filename '/home/spam/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

#vimode: Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

#vimode: Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select


#zplug plugin manager
source ~/.zplug/init.zsh
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-autosuggestions"

zplug "Aloxaf/fzf-tab"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

#Then, source plugins and add commands to $PATH
zplug load

#autosuggest config
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


#Import/Export
path+=('/home/spam/.scripts/')
path+=('/home/spam/.npm-global/bin')
path+=('/home/spam/go/bin')
export NODE_PATH="$HOME/.npm-global/lib/node_modules/"
export _JAVA_AWT_WM_NONREPARENTING=1 # IDEA hack
export PATH
export EDITOR=nvim
export FZF_DEFAULT_OPTS='--height 42% --no-reverse'
export XSECURELOCK_NO_COMPOSITE=1
export ZSH_ALIAS_FINDER_AUTOMATIC=true
export ZSH_AUTOSUGGEST_USE_ASYNC=true

export PYENV_ROOT="/home/spam/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

source ~/.config/zshscripts/spaceship.zsh
source ~/.aliases
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

#Plugins
source ~/.config/zshscripts/alias-finder.zsh
source /usr/share/nvm/init-nvm.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/spam/Clones/google-cloud-sdk/path.zsh.inc' ]; then . '/home/spam/Clones/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/spam/Clones/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/spam/Clones/google-cloud-sdk/completion.zsh.inc'; fi
