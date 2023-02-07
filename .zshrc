# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
PROMPT_EOL_MARK=''
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
KEYTIMEOUT=1
ZSH_THEME="powerlevel10k/powerlevel10k"

zle_highlight=('paste:none')
POWERLEVEL9K_INSTANT_PROMPT=quiet

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

function precmd() {
  echo ""
  echo -ne "\e]1;${PWD##*/}\a"
}

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# PLUGINS

plugins=(
#  autojump 
  brew 
#  bundler 
  catimg 
  colored-man-pages 
  colorize
  command-not-found 
  fancy-ctrl-z
  fzf 
  #git 
  httpie 
  iterm2
  jsontools
  node 
  npm 
  rbenv 
  #vi-mode 
  vscode 
  web-search 
  #wp-cli 
  zsh-autosuggestions
  zsh-interactive-cd
  z
)

ZSH_COLORIZE_STYLE="colorful"
export BAT_THEME="Nord"

source $ZSH/oh-my-zsh.sh
source $HOME/.todoist/todoist_functions.sh 

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
# ZSH_TMUX_AUTOCONNECT 
ZSH_TMUX_AUTOQUIT=false
# ZSH_TMUX_FIXTERM=true 
# ZSH_TMUX_ITERM2=true
ZSH_TMUX_FIXTERM_WITHOUT_256COLOR=true 
ZSH_TMUX_FIXTERM_WITH_256COLOR=true 

# Bind Ctrl + space to complete autosuggest
bindkey '^ ' autosuggest-accept

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# My personal aliases are set in ~/.oh-my-zsh/custom/myaliases.zshexport 
PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
# Ruby exports

export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/usr/local/lib/ruby/gems/2.6.0/bin:$PATH

# export PATH="$HOME/.node/bin:$HOME/.rbenv/shims:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
#export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --color=always"
#export FZF_DEFAULT_COMMAND='fd --type file --color=always --hidden "!{node_modules/*,.git/*}"'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
#export PATH="/usr/local/opt/php@7.2/bin:$PATH"

export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='⚡️'
POWERLEVEL9K_DIR_FOREGROUND='104'
POWERLEVEL9K_DIR_HOME_FOREGROUND='43'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='146'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='187'
POWERLEVEL9K_VCS_FOREGROUND='159'

# Vi mode
POWERLEVEL9K_VI_INSERT_MODE_STRING="ⓘ "
POWERLEVEL9K_VI_COMMAND_MODE_STRING="ⓝ "
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='x'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='114'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='x'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='230'

# eval "$(rbenv init - zsh)"
export PATH="/usr/local/opt/whois/bin:$PATH"

eval $(thefuck --alias)

# pnpm
export PNPM_HOME="~/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
