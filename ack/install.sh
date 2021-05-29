ack='$(brew --prefix)/bin/ack'

if test -f $ack
then
  brew install ack
fi
