# create folder if destination folder does not exist
mkdir -p ~/.config/terminator

# bckup the existing config file, if exists
if [ -f ~/.config/terminator/config ]; then
  mv ~/.config/terminator/config ~/.config/terminator/config.bck
fi

# copy the config file to the destination folder
cp terminator_profile ~/.config/terminator/config

# echo the success message
echo "The terminator is bacK 🚀"
