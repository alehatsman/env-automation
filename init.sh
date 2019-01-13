if ! type "make" > /dev/null; then
  echo "xcode tools are not installed."
  xcode-select --install
else
  echo "xcode tools are alredy installed. Skipping..."
fi
if ! type "brew" > /dev/null; then
  echo "brew is not installed."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "brew is already installed. Skipping..."
fi
if ! brew ls --versions ansible > /dev/null; then
  echo "ansible is not installed."
  brew install ansible
else
  echo "ansible is already installed. Skipping..."
fi

echo "Done."
