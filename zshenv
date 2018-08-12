# Path alteration

## Go environment
export GOPATH=$HOME/src/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

## WARNING Always make this the last alteration, can compromise security
export PATH=$PATH:./node_modules/.bin
