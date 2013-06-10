echo "
    __ _  ___  _ __   ___ 
   / _\` |/ _ \\| '_ \\ / _ \\
  | (_| | (_) | |_) |  __/
   \__, |\___/| .__/ \___|
    __/ |     | |         
   |___/      |_|         

+++++++++++++++++++++++++++++
  GO PATHS AND ENVIRONMENTS
+++++++++++++++++++++++++++++

"

if [ -e "$HOME/.gope" ]
then
  echo
  echo "Whoa, there!  Looks like you've already installed gope."
  echo "You'll need to be removing that existing install at $HOME/.gope."
  echo
  exit
fi

echo "OK, so basically I'm going to install a few files to ~/.gope and append some
shell goodness to .profile in a safe way.  Is that cool? (yes/no)"

read choice

if [ "$choice" = "yes" ]
then
  echo "OK, creating the directories I need..."
  mkdir -p "$HOME/.gope"
  echo ""

  echo "Now I'm cloning gope..."
  return_to=`$pwd`
  cd "$HOME/.gope"
  git clone git://github.com/jm/gope.git scripts
  echo ""

  echo "Installing my little shell initializer..."
  touch "$HOME/.profile"
  cat "$HOME/.gope/scripts/initializer.sh" >> "$HOME/.profile"
  echo ""

  echo "OK, all done!  Open a new shell to get started."
  cd $return_to
else
  echo
  echo "Run me again if you end up wanting to install gope!"
  echo
fi