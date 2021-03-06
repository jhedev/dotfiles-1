My Dotfiles
============

Configurations and optimisations primarily for Zsh, Neovim, and Spacemacs.

Please be aware that _these configurations are designed for my own personal use_. You are of course welcome to make use of whatever you find here, but do understand that I take no responsibility for anything that backfires on your machine. (There’s really nothing scary in here. Just a word of caution.)

### Credits
The dotfiles are managed with [rcm by Thoughtbot](https://github.com/thoughtbot/rcm), which is an awesome, lightweight tool for keeping dotfiles synced and organised.

Some Zsh and Git configurations have been borrowed from the [YADR dotfiles](https://github.com/skwp/dotfiles) repository. I have attempted to make mention of all of these instances within the code to give credit where it is due.

## What’s included

### Zsh and Git
I use [Zgen](https://github.com/zsh-users/antigen) to manage my ZSH plugins, because it is awesome. Zgen is sourced and applied (and relevant plugins are called) all from the .zshrc file. It is installed as a submodule of this repo.

The `gitconfig` included is primarily borrowed from YADR, and includes some sensible aliases and defaults for Git’s CLI. **User-specific Git configurations should be stored in ~/.gitconfig.user**.

Also provided are a small number of convenient Zsh aliases — [take a look at them here](https://github.com/colepeters/dotfiles/blob/master/aliases.zsh).

Please note that:
- any private info (e.g. API tokens, etc) should be stored in a `~/.secrets` file, which is sourced automatically if it exists
- any private aliases (e.g. server ssh logins, etc) should be stored in a `~/.aliases.user.zsh`, which is also sourced automatically if it exists

### Neovim
Neovim is like Vim, but (in my humble opinion) better. I particularly love its asynchronous plugin architecture, how fast its development community is growing, and how well maintenance and support is handled. I keep my configuration pretty lean.

### Hyper
My config for [Hyper](//hyper.is) is pretty minimal. Word.

### Spacemacs
My `.spacemacs` file specifies the configuration layers I use on a regular basis, which are mostly aimed at HTML, CSS, and JS development. In particular, the JS syntax checking is tuned for ESLint. I’ve also bound `meta` to the `fn` key, which allows me to use the left `opt` key for inserting diacritics and special characters. I don’t use Spacemacs much anymore but am keeping this around for now.

## Usage (OS X)
These instructions have been tested on my own machine (OS X 10.11, using the latest version of [iTerm2](https://www.iterm2.com/)). They presume that you do **not** already have a `.dotfiles` directory in your user (`~`) directory.

### Prerequisites

- [Homebrew](http://brew.sh/)
- Correct Hombrew permissions: `sudo chown -R "$USER":admin /usr/local && sudo chown -R "$USER":admin /Library/Caches/Homebrew`
- [Node and npm](https://nodejs.org/en/)
- Non-system install of Python (`brew install python` / `brew install python3`)
- [Pip](https://pip.pypa.io/en/stable/) (This will be installed alongside Python from Homebrew, see above)
- [Neovim](https://neovim.io)
- Ag (`brew install ag`) in order for FZF to work with the default command
- Pure (`npm install -g pure-prompt`)

### Install

```shell
# Install Zsh
brew install zsh

# Add zsh to standard shells
sudo vi /etc/shells              # Add /usr/local/bin/zsh to the end of this file

# Switch into Zsh — don’t worry if it looks like crap for the moment
chsh -s /usr/local/bin/zsh

# Clone the repo to into a ".dotfiles" directory in your user directory
git clone git@github.com:colepeters/dotfiles.git ~/.dotfiles

# Switch to the new directory
cd ~/.dotfiles

# Initialise and update Zgen submodule
git submodule init && git submodule update

# Install RCM
brew tap thoughtbot/formulae
brew install rcm

# Copy the RCM config file to your ~ directory first
rcup -v rcrc

# Generate symlinked dotfiles in your ~ directory
rcup -v
```

### Additional packages
Some aliases and configurations depend on these little packages to work:

```shell
# Some Neovim packages (e.g. deoplete) require Neovim with `if_python3`
pip3 install neovim

# diff-so-fancy, for better git diffs:
npm install -g diff-so-fancy

# Tig, a Git CLI wrapper:
brew install tig

# HTTPie, a nice cURL replacement:
brew install httpie

# flake8, for linting Python files
pip install flake8
```

### Optional add-ons
These CLI applications make my life easier:

```shell
# Standard, a great JS standard that I use when not writing to an eslintrc spec
# (Also Snazzy, which gives a prettier output when running Standard on the CLI)
npm i -g standard snazzy

# tldr, aka quick and useful documentation for CLI commands
npm i -g tldr

# Ranger file manager
brew install ranger
```

### 🎉 Ta-da
You should now be able to open a new shell session and have everything be not horrible and hopefully cooler and ready to go.

Worh repeating:
- any private info (e.g. GitHub tokens, etc) should be stored in a `~/.secrets` file, which is sourced automatically if it exists
- any private aliases (e.g. server ssh logins, etc) should be stored in a `~/.aliases.user.zsh`, which is also sourced automatically if it exists
