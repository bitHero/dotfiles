#Download Elementary OS from here: 
#http://sourceforge.net/projects/elementaryos/files/stable/

# Add Package Repositories
# ---------------------------------------------------------------------

# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'


sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:unit193/sourcecodepro
sudo add-apt-repository -y ppa:mpstark/elementary-tweaks-daily
sudo add-apt-repository -y ppa:xorg-edgers/ppa # Nvidia and AMD Drivers

# !!!!!!!!!!! No support (Yet) for Freya !!!!!!!!!!!!!!!!
# sudo apt-add-repository -y ppa:versable/elementary-update

# Update Repository Cache
# ---------------------------------------------------------------------
sudo apt-get update && sudo apt-get dist-upgrade


# Install Applications
# ---------------------------------------------------------------------

#Install Google Chrome
sudo apt-get -y install google-chrome-stable

#Install File Compression Libs
sudo apt-get -y install unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

#Install DCONF Tools
sudo apt-get install dconf-tools

#Install Ubuntu Restricted Extras
sudo apt-get -y install ubuntu-restricted-extras

#Enable Movie DVD Support
sudo apt-get -y install libdvdread4
sudo /usr/share/doc/libdvdread4/install-css.sh


#Install screenfetch (elementary-OS special Version)
mkdir screenfetch
cd screenfetch
wget https://raw.github.com/memoryleakx/screenFetch/master/screenfetch-dev
sudo mv screenfetch-dev /usr/bin/screenfetch
cd ..
rm -rf screenfetch

#make it readable and executable
sudo chmod +rx /usr/bin/screenfetch


# # For Nvidia Cards
# sudo apt-get -y install nvidia-331

# # For AMD/ATI Cards 
# sudo apt-get -y install fglrx-installer

#Install a Firewall Application
sudo apt-get -y install gufw

#Install Elementary OS extras
sudo apt-get -y install elementary-tweaks

# !!!!!!!!!!! No support (Yet) for Freya !!!!!!!!!!!!!!!!
# sudo apt-get -y install elementary-desktop elementary-tweaks
# sudo apt-get -y install elementary-dark-theme elementary-plastico-theme elementary-whit-e-theme elementary-harvey-theme
# sudo apt-get -y install elementary-elfaenza-icons elementary-nitrux-icons
# sudo apt-get -y install elementary-plank-themes
# sudo apt-get -y install wingpanel-slim indicator-synapse

#Install Fonts
sudo apt-get -y install fonts-source-code-pro-otf
sudo apt-get -y install fonts-source-code-pro-ttf

#Install Sublime Text
sudo apt-get -y install sublime-text

# Clean-up System
# ---------------------------------------------------------------------

# Remove Midori Browser
sudo apt-get -y purge midori-granite

# Remove Music Player Thing
sudo apt-get -y purge noise

# Tidy Up
sudo apt-get -y autoremove
sudo apt-get -y autoclean

# Configure some setting
# ---------------------------------------------------------------------

# Enable all Startup Applications
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

# Sets up Pantheon Terminal with the desired attributes

gsettings set org.pantheon.terminal.settings palette '#2d2d2d:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#0091c8:#d3d0c8:#5b5b5b:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#00adef:#f2f0ec'

gsettings set org.pantheon.terminal.settings font 'Source Code Pro'
gsettings set org.pantheon.terminal.settings cursor-color '#00adef'


