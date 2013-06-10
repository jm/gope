function gope-init() {
  if [ -f `pwd`/.go ];
  then
    export GOPATH=`pwd`
    echo -e "GOPATH setup for $(tput setaf 2)$GOPATH$(tput sgr0)"
  else
    if [ -f $OLDPWD/.go ];
    then
      unset GOPATH
    fi
  fi  
}

function gope-create() {
  echo -e "$(tput bold)->$(tput sgr0) $(tput setaf 2)Generating project in $1$(tput sgr0)"
  echo -e "\tMaking directories..."
  mkdir -p $1
  mkdir -p $1/src
  mkdir -p $1/pkg
  echo -e "\tMaking .go file..."
  touch $1/.go
  echo -e "$(tput bold)->$(tput sgr0) $(tput setaf 2)Done.$(tput sgr0)"
}