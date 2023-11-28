#!/bin/bash

# ssh-keygen -t ed25519 -C “jason.lieb@outlook.com”
# [Enter x3]
# `eval "$(ssh-agent -s)"`
# `ssh-add ~/.ssh/id_ed25519`
# nix-env -iA nixos.**xclip**
# cat ~/.ssh/id_ed25519.pub
# [Copy ssh key (entire output) and paste into github]
# `nix-env -iA nixos.**git**`
# sudo git clone git@github.com:jason-lieb/Nix-Configuration.git
# [Enter password]
# [Type yes]
# cd Nix-Configuration
# sudo mv configuration.nix ..
# sudo mv .gitignore ..
# sudo mv .git ..
# cd ..
# sudo rmdir Nix-Configuration
# git config --global --add safe.directory /etc/nixos