#!/bin/bash

# Install starship, add it to all rc files, and copy the toml.
curl -fsSL https://starship.rs/install.sh | sh -s -- -y
echo '\neval "$(starship init bash)"' >>~/.bashrc
echo '\neval "$(starship init bash)"' >>~/.zshrc

# Copy the starship.toml file to the home directory.
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml
echo "Starship installed 💫"
