#!/bin/bash

echo "🔧 Installing CLI productivity tools..."

# Update system
sudo pacman -Syu --noconfirm

# List of packages to install
packages=(
  bc
  fzf
  tldr
  bat
  yazi
  ranger
  calc
  viu
  ripgrep
  fd
  htop
  fastfetch
  calcurse
  taskwarrior
  taskell
  xpdf
  p7zip
  ncdu
  md-tui
  xcolor
  cal
)

# Install each package
for pkg in "${packages[@]}"; do
  echo "➡️ Installing $pkg..."
  sudo pacman -S --noconfirm --needed "$pkg"
done

# Optional: Configure `tldr` for first-time use
echo "📘 Updating tldr cache..."
tldr --update

echo "✅ All tools installed successfully!"
