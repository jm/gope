function gope-init() {
  if [ -f `pwd`/.gopath ];
  then
    paths=""

    while read line
    do
      local path=`realpath $line`
      paths="$path:$paths"
    done < <(cat `pwd`/.gopath)

    if [ "$paths" == "" ]
    then
      export GOPATH=`pwd`
    else
      export GOPATH=`pwd`:$paths
    fi

    echo -e "GOPATH setup for $(tput setaf 2)$GOPATH$(tput sgr0)"
  else
    if [ -f $OLDPWD/.gopath ];
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
  echo -e "\tMaking .gopath file..."
  touch $1/.gopath
  echo -e "$(tput bold)->$(tput sgr0) $(tput setaf 2)Done.$(tput sgr0)"
}