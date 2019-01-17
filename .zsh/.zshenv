## Go environment
export GOPATH=$HOME/src/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

## Language
export LANG=en_GB.UTF-8
export LC_CTYPE=sv_SE.UTF-8

## WARNING Always make this the last alteration, can compromise security
export PATH=$PATH:./node_modules/.bin
