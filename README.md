# Miikka's dotfiles

## Shell utilities

* [z](https://github.com/rupa/z) for quickly changing directories.

## Stow

`core` can be installed with stow.

```sh
mkdir -p "$HOME/bin"
stow -t "$HOME" core
```

If you don't have stow, you can use `core/bin/ministow`:

```sh
core/bin/ministow -t "$HOME" core
```

## NixOS

Add the [nixos-hardware] channel:

```sh
sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo nix-channel --update
```

[nixos-hardware]: https://github.com/NixOS/nixos-hardware
