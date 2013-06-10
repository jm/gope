if [ -f $HOME/.gope/config ];
then
  source $HOME/.gope/config
fi

SCRIPTPATH="`dirname $BASH_SOURCE`"
source $SCRIPTPATH/functions.sh

if [ ! $add_subcommands = "" ];
then
  export GOBINPATH=`which go`
  export PATH=$SCRIPTPATH/bin:$PATH
fi

if [ ! $auto_init = "" ];
then
  source $SCRIPTPATH/override.sh
fi