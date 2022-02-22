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




#autosuggest config
bindkey '^ ' autosuggest-accept
bindkey '^[ ' autosuggest-toggle
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

source ~/.config/zsh_config/spaceship_conf.zsh
source ~/.aliases
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

#Plugins
source ~/.config/zsh_config/alias-finder.zsh
source ~/.config/zsh_config/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/spam/.config/zsh_config/fzf-tab/fzf-tab.plugin.zsh
source /home/spam/.config/zsh_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source /usr/share/nvm/init-nvm.sh (SLOWS PROMPT)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/spam/Clones/google-cloud-sdk/path.zsh.inc' ]; then . '/home/spam/Clones/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/spam/Clones/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/spam/Clones/google-cloud-sdk/completion.zsh.inc'; fi


#Prompt
autoload -U promptinit; promptinit
prompt spaceship
