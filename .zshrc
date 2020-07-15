export PATH=$PATH:${HOME}/blender/blender.app/Contents/MacOS
export PATH=$PATH:/Applications/Google\ Chrome\ Canary.app/Contents/MacOS
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:
export PATH=$PATH:/sbin
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH=${HOME}/.rbenv/shims:$PATH
export PATH=${HOME}/.nodenv/bin:$PATH
export PATH=${HOME}/.goenv/shims:$PATH
export PATH=${HOME}/.pyenv/shims:$PATH
export PATH=${HOME}/.poetry/bin:$PATH
export PATH="$PATH:`yarn global bin`"

eval "$(rbenv init -)"
eval "$(nodenv init -)"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# 日本語使う
export LANG=ja_JP.UTF-8

autoload -Uz vcs_info
vcs_info
autoload -Uz colors
colors
# 補完
autoload -Uz compinit
compinit

alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias so='source'
alias v='vim'
alias vi='vim'
alias k='kubectl'
alias dcb='docker-compose build'
alias dcu='docker-compose up'
alias dcr='docker-compose run'

setopt share_history

# コマンドミス修正
setopt correct

zstyle ':vcs_info:*' formats '(%s)[%b]'

zstyle ':vcs_info:*' actionformats '(%s)[%b|%a]'

precmd () { vcs_info }

setopt prompt_subst

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%*%) %~
%# "

RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

function peco-select-history() {
    # historyを番号なし、逆順、最初から表示。
    BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
    CURSOR=$#BUFFER             # カーソルを文末に移動
    zle -R -c                   # refresh
}
zle -N peco-select-history
bindkey '^R' peco-select-history

export FLASK_ENV=development
export GOOGLE_APPLICATION_CREDENTIALS=${HOME}/.config/gcloud/application_default_credentials.json

export CFLAGS="-I/usr/local/Cellar/openssl/1.0.2s/include"
export LDFLAGS="-L/usr/local/Cellar/openssl/1.0.2s/lib"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/saki/.gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/saki/.gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/saki/.gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/saki/.gcloud/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=/usr/local/Cellar/openssl@1.1/1.1.1g/bin:$PATH
