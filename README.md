# Dotfiles

Personal Linux shell and terminal configuration files for Bash, Zsh, Csh, Git, and Vim.

## Contents

- `bash/` - Bash configuration and aliases
- `zsh/` - Zsh configuration
- `csh/` - Csh configuration
- `shell/` - Shared shell settings
- `git/` - Git configuration and global ignore rules
- `vim/` - Vim configuration
- `install.sh` - Creates symlinks from this repository into your home directory

## Installation

Clone the repository and run the installer:

```sh
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The installer detects the current shell and links the appropriate configuration files. It also links the shared input configuration, Git configuration, global Git ignore file, and Vim configuration.

Start a new terminal or reload your shell after installation.

## Backup Alias

The Bash configuration includes a `backup-projects` function. By default, it backs up `$HOME/PROJECTS` to `$HOME/PROJECTS_Backup`.

To use a different destination:

```sh
export PROJECTS_BACKUP_DIR="/path/to/backup"
```

## Git Identity

The included Git config keeps the author name but does not contain a personal email address. Set your preferred identity locally after installation if needed:

```sh
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

For GitHub commits, use the noreply address shown in your GitHub account settings.

## License

This project is available under the MIT License. See [LICENSE](LICENSE).
