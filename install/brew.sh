if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  python
  sqlite
  bash-completion2
  battery
  coreutils
  git
  git-extras
  grep --with-default-names
  imagemagick
  jq
  psgrep
  shellcheck
  ssh-copy-id
  wget
  wifi-password
  vim
  yarn
  qt@5.5
  mysql
  postgresql
  elasticsearch
  heroku
  heroku-node
  hub
  redis
  zsh
  node
  curl
)

brew install "${apps[@]}"

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
