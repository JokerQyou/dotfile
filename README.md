# dotfile
My config files

## What is this?
Some of my configuration files.
Currently contains:

* `.vimrc`: my vim config
* `.zshrc`: my zsh config

## Why in a git repository?
It's takes a long time to properly configure these basic tools, especially when
you have different environments, e.g., when you're setting up a new server or
virtual machine.

Maintaining a unified set of configuration files, on the other hand, make these
process fast - just clone a repo, symlink config files, and you're done.

## How to use?
On `*nix` system (Linux, Mac OS, etc.):
* If you don't have your own config yet,
  just run `ln -s /path/to/config/file/in/this/repo`.
* Otherwise load config files in your own version, for example,
  put `source /path.tp/.vimrc/in/this/repo` in your `.vimrc`.

On Windows you'll have to load my config files in your own version.
