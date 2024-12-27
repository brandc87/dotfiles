# Dotfiles

This repository contains my simple dotfiles personal setup.
Adapted from [Petar Radošević](https://github.com/wunki/dotfiles)

## Software

| Name        | Description                                                                           |
|-------------|---------------------------------------------------------------------------------------|
| [Ghostty]   | Alacritty is a fast terminal.                                                         |
| [Fish]      | Shell with good defaults and easy to configure                                        |
| [Zed]       | Fast GUI editor |

[Ghostty]: https://ghostty.org
[Fish]: https://fishshell.com/
[Zed]: https://zed.dev

## Usage

Clone the repository: `git clone https://github.com/brandc87/dotfiles.git dotfiles`.

The dotfiles directory contains a `Makefile` which will symlink files into the right place. Proceed with caution though, it will override your own configuration. To give an example, you can run `make zed` to configure Zed.
