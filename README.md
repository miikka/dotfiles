# Miikka's dotfiles

## Shell utilities

* [z](https://github.com/rupa/z) for quickly changing directories.

## Stow

`core` can be installed with stow.

```sh
stow -t "$HOME" core
```

If you don't have stow, you can use `core/bin/ministow`:

```sh
core/bin/ministow -t "$HOME" core
```
