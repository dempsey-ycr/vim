if brew list | grep coreutils > /dev/null ; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  alias ls='ls -F --show-control-chars --color=auto'
  eval `gdircolors -b $HOME/.dir_colors`
fi

# http proy
#{http,https}_proxy="http:sg2.mgyvpn.com:3597"


# apps 
alias mvi="/Applications/MacVim.app/Contents/bin/mvim"
#alias redis_server="/usr/local/redis-5.0.4/src/redis-server"
#alias redis_cli="/usr/local/redis-5.0.4/src/redis-cli"
alias mgo_start="~/.server.sh 'mongo_start'"
alias mgo_stop="~/.server.sh 'mongo_shutdown'"
alias mgo_cli="~/.server.sh 'mongo_cli'"

alias redis_start="~/.server.sh 'redis_start'"
alias redis_stop="~/.server.sh 'redis_shutdown'"
alias redis_cli="~/.server.sh 'redis_cli'"

alias mysql_start="~/.server.sh 'mysql_start'"
alias mysql_stop="~/.server.sh 'mysql_shutdown'"
alias mysql_cli="~/.server.sh 'mysql_cli'"
alias subl="/Applications/'Sublime Text.app'/Contents/SharedSupport/bin/subl"
