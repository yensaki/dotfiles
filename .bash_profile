export PATH=$PATH:${HOME}/blender

export GOPATH="$HOME/.go"

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/pixiv/factory/vendor/go-factory/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH=${HOME}/.rbenv/shims:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=${HOME}/.pyenv/shims:$PATH

eval "$(rbenv init -)"
eval "$(nodenv init -)"

export PATH="$HOME/.poetry/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
