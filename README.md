# Linux Setup

This repository contains my personal Linux setup, including configurations for Zsh, Bash, Vim (with Pathogen plugins), and other tools. It helps to quickly set up my development environment on any Linux machine.

## Contents

- **Zsh**: `.zshrc` configuration
- **Bash**: `.bashrc` and `.bash_profile`
- **Vim**: `.vimrc` and plugins managed via Pathogen
- **Tmux**: `.tmux.conf`
- **Git**: `.gitconfig`

## Installation

### Step 1: Clone the repository

Clone this repository into your home directory or another preferred location:

```bash
git clone git@github.com:<your-username>/linux-setup.git ~/linux-setup
```

### Step 2: Run the install script

To set up the configuration files (and Vim plugins), run the provided installation script. This will create symbolic links for the dotfiles in the appropriate locations.

```bash
cd ~/linux-setup
bash install.sh
```

This will:

- Link `.bashrc`, `.zshrc`, `.vimrc`, and other configuration files to your home directory.
- Install Vim plugins managed by Pathogen by linking the `bundle/` folder.

### Step 3: Customize as needed

Feel free to modify any configuration file to fit your preferences. For example, you can update `.vimrc` or add new Zsh plugins to `.zshrc`.

## Manual Setup

If you prefer to manually link the files instead of running the `install.sh` script, use the following commands:

```bash
# Bash configuration
ln -sf ~/linux-setup/bash/.bashrc ~/.bashrc

# Zsh configuration
ln -sf ~/linux-setup/zsh/.zshrc ~/.zshrc

# Vim configuration and plugins
ln -sf ~/linux-setup/vim/.vimrc ~/.vimrc
ln -sf ~/linux-setup/vim/bundle ~/.vim/bundle

# Tmux configuration
ln -sf ~/linux-setup/tmux/.tmux.conf ~/.tmux.conf

# Git configuration
ln -sf ~/linux-setup/git/.gitconfig ~/.gitconfig
```

## Vim Plugins (Pathogen)

If you're using **Pathogen** to manage Vim plugins, ensure Pathogen is installed:

```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Plugins are located in the `vim/bundle/` directory. To add or update plugins, simply add them to this directory, or use Git submodules if desired.

## Keeping Plugins Updated

Since the `.git` directories have been removed from the Pathogen plugins in this repository, updating them manually can be challenging. Here are a few ways to handle updates:

### Option 1: Use Git Submodules (Recommended)

To manage and update Vim plugins more efficiently, you can add each plugin as a Git submodule. This will allow you to easily pull updates for individual plugins:

```bash
git submodule add https://github.com/user/plugin.git vim/bundle/plugin
```

When you want to update the plugins, run:

```bash
git submodule update --remote --merge
```

### Option 2: Install Plugins via a Script

Instead of including the plugin directories, you can modify your `install.sh` script to download the latest versions of each plugin directly from their repositories:

```bash
# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install Vim plugins
git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
```

This way, you can always fetch the latest versions of the plugins.

## Updating Your Dotfiles

To update your local setup after making changes, simply commit and push the changes:

```bash
git add .
git commit -m "Updated Zsh and Vim configurations"
git push origin main
```
