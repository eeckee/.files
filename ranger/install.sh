#!/bin/bash
echo "Linking ~/.files/ranger -> ~/.config/ranger"

echo "Creating ~/.config/ranger directory and links"
rm -rf ~/.config/ranger
mkdir -p ~/.config/ranger
ln -sf ~/.files/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf ~/.files/ranger/scope.sh ~/.config/ranger/scope.sh
ln -sf ~/.files/ranger/commands.py ~/.config/ranger/commands.py
ln -sf ~/.files/ranger/commands_full.py ~/.config/ranger/commands_full.py

echo "Cloning ranger_devicons into ranger directory"
git clone https://github.com/alexanderjeurissen/ranger_devicons.git ~/.config/ranger/ranger_devicons
cd ~/.config/ranger/ranger_devicons && make install


case `uname` in
    Darwin)
		# Switch rc file for macos rc file
		ln -sf ~/.files/ranger/macrc.conf ~/.config/ranger/rc.conf
            ;;
    Linux)
		ln -sf ~/.files/ranger/rc.conf ~/.config/ranger/rc.conf
        ;;
esac

