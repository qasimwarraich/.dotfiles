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

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search   # Up
bindkey "^[[B" down-line-or-beginning-search # Down

#vimode: Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

#autosuggest config
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#Import/Export
fpath=("$HOME/.config/zsh_config/zprompts" "$fpath[@]")
path+=('/home/spam/.scripts')
path+=('/home/spam/.npm-global/bin')
path+=('/home/spam/go/bin')
path+=('/home/spam/.local/share/gem/ruby/3.0.0/bin')
path+=('/home/spam/.local/share/coursier/bin')
path+=('/home/spam/.local/bin')

export NODE_PATH="$HOME/.npm-global/lib/node_modules/"
export _JAVA_AWT_WM_NONREPARENTING=1 # IDEA hack
export PATH
export EDITOR=nvim
export FZF_DEFAULT_OPTS='--height 42% --no-reverse'
export XSECURELOCK_NO_COMPOSITE=1
export ZSH_ALIAS_FINDER_AUTOMATIC=true
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export GPG_TTY=$(tty)

source ~/.aliases
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

#Plugins
source ~/.config/zsh_config/alias-finder.zsh
source ~/.config/zsh_config/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/spam/.config/zsh_config/fzf-tab/fzf-tab.plugin.zsh
source /home/spam/.config/zsh_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/spam/Clones/google-cloud-sdk/path.zsh.inc' ]; then . '/home/spam/Clones/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/spam/Clones/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/spam/Clones/google-cloud-sdk/completion.zsh.inc'; fi

#Prompt
eval "$(starship init zsh)"
