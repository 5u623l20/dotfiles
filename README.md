# dotfiles

BOFH's dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

Install them with:

    command -v curl > /dev/null && sh -c "$(curl -fsLS https://raw.githubusercontent.com/5u623l20/dotfiles/main/install)" || command -v wget > /dev/null && sh -c "$(wget -qO- https://raw.githubusercontent.com/5u623l20/dotfiles/main/install)" || command -v fetch > /dev/null && sh -c "$(fetch -q -o - https://raw.githubusercontent.com/5u623l20/dotfiles/main/install)"
