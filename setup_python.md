# Python Setup

On macOS, `python3` is the default python command. It's named this way to disambiguate it from python 2 (which would be `python`).

Homebrew's version of python is generally a bit more up to date than the bundled macOS one  (macOS 12.6 comes with 3.9.6 at the time of writing), so I prefer to use Homebrew's package.

Homebrew has versioned packages available, such as `python@3.11` and a generic `python3` package (which is a recent stable version, but not necessarily the latest).  
The versioned packages install an executable with the version in the name, e.g. `python3.10`, `python3.11`, but do not alter the `python3` executable. 

As this could lead to potential confusion between the homebrew and macOS installations of python, I prefer to use `brew install python3`, as that will install a `python3` executable to `$(brew --prefix)/bin/python3`. Since `$(brew --prefix)/bin/` comes before `/usr/bin` on the `$PATH`, it will have precedence over the macOS python installation and avoid confusion.

# TODO
* poetry
* pyenv
