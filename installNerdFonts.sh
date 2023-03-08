#/bin/bash
# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
export FONT_NAME="Ubuntu"
export FONT_URL=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep $FONT_NAME | cut -d '"' -f 4)
echo $FONT_URL
wget $FONT_URL
unzip $FONT_NAME.zip -d ~/.local/share/fonts
fc-cache -fv
echo "done!"
