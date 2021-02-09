git clone https://github.com/ryanoasis/nerd-fonts.git
nerd-fonts/install.sh
find ~/.local/share/fonts/NerdFonts -exec fc-scan --format '%{family}\n' {} \; | sort | uniq > fonts.txt
