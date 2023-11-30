#/bin/bash
# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
export FONT_NAME="DejaVuSansM"
export FONT_URL=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep $FONT_NAME | cut -d '"' -f 4)
echo $FONT_URL
wget $FONT_URL
# Unzip and overwrite if necessary
echo "[-] Unzip fonts [-]"
unzip -o -d ~/.local/share/fonts/ $FONT_NAME.zip

rm $FONT_NAME.zip
# sudo apt install fontconfig
fc-cache -fv

echo "[+] Fonts installed [+]"
