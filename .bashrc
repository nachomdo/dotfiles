alias ctags='/usr/local/bin/ctags'
export TERM=xterm-256color

export ZOOKEEPER_ADDRESS=$(docker-machine ip default):2181
export SCHEMA_REGISTRY_URL=http://$(docker-machine ip default):8081

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
