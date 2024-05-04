+ Install xcode tools
```
xcode-select --install
```

+ Install Home Brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git 
ssh-keygen -t rsa -b 4096
```

+ Add ssh key to Github
+ Install my dot files
```
git clone git@github.com:StefPac/ConfigFiles.git
cd ConfigFiles
bin/spacific-config-setup
```
+ Copy following files from previous system
```
.emacs/tramp-ssh-config.el
```

+ Configure p10k 
```
p10k configure
``
+ Install fonts
```
brew tap homebrew/cask-fonts
brew install font-fira-code --cask
brew install font-ibm-plex --cask
```
++ Install Berkeley Mono

+ Install iTerm 2
```
brew install --cask iterm2
3.12.2
```
++ Install iTerm2 themes (after having installed iTerm2)
```
open ConfigFiles/iTerm2-themes/spacific.itermcolors
```

++ Configure iTerms fonts (Preferences->Profiles->Text)
++ Change left Option key to Esc+ (Preferences->Profiles->Keys->General)
++ Preferences->Profiles->Keys->Key Mappings->Presets->Terminal.app compat.

+ Install Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

```

+ Set up emacs and emacs copilot

++ Download emacs source
++ build with the [emacs build script](../bin/build-emacs.sh) (or use [the one with GUI](../bin/build-emacs-x.sh))
++ Confirm gcc and libgccjit are installed from brew
++ Ensure node is installed
```
nvm use --lts
nvm install node
```
++ from within emacs run `M-x copilot-login`

+ Setup Pyenv
```
pyenv install -l 
pyenv install 3.12.2
```

++ Insstall nerd fonts 
```
brew install --cask font-symbols-only-nerd-font
```

+ Install Printer Drivers
