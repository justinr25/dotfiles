# Justin's Dotfiles

My personal configuration files managed using [GNU Stow](https://www.gnu.org/software/stow/).

---

## Setting Up a New Machine

Follow these steps to deploy these configurations on a new Mac:

### 1. Install GNU Stow
Make sure Homebrew is installed, then install Stow:
```bash
brew install stow
```

### 2. Clone this repository
Clone the repository to your home folder:
```bash
git clone git@github.com:justinr25/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Deploy configurations
Run the setup script:
```bash
./setup.sh
```

---

## How to add a new application config

If you want to track a new configuration folder (e.g., `kitty` terminal configuration at `~/.config/kitty`):

1. **Move** the folder into this repository:
   ```bash
   mkdir -p ~/dotfiles/kitty
   cp -r ~/.config/kitty ~/dotfiles/kitty/kitty
   rm -rf ~/.config/kitty
   ```
2. **Update `setup.sh`**:
   Add `kitty` to the `stow` command list in `setup.sh`.
3. **Stow it**:
   ```bash
   ./setup.sh
   ```
