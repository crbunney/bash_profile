# Command Line Setup for macOS

# Prerequisites

1. Clone the repo & symlink the files as described in [README.md](README.md)

## Set Default Shell to Bash

The systems my work targets use bash, but OSX now defaults to `zsh`.

To avoid issues where scripts & commands "work on my machine", but not on other machines, I prefer to use bash.

Full documentation on how to change the login shell (referred to as default shell in the docs): https://support.apple.com/en-gb/HT208050

1. Open Terminal
1. Run `chsh -s /bin/bash`

## Install Homebrew

Full docs: https://brew.sh/

Homebrew is a package manager for macOS, which simplifies the installation and management of many command line dev tools.

We switched the default shell before doing this because Homebrew might be performing some actions based on which shell the installer is run from.

1. Open a new Terminal
1. Run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
1. Follow prompts

The output includes some commands to run that update the `.bash_profile`, but they are already incorporated in the version in this repo.

## Update bash

Due to licensing issues, the bundled version of bash is very old:
```bash
$ bash --version
GNU bash, version 3.2.57(1)-release (arm64-apple-darwin21)
Copyright (C) 2007 Free Software Foundation, Inc.
```
_Note: This version was release in 2007!_ Apparently Apple didn't want to agree to the different open source licence newer versions were release under, so just didn't update it.

As well as lacking more recent features, it also lacks any bugfixes or security fixes since it stopped being maintained.

Full details here: https://itnext.io/upgrading-bash-on-macos-7138bd1066ba

### Install Updated bash

1. Open Terminal
1. Confirm current installations with `which -a bash` (expect a single result)
1. Run `brew install bash`
1. Confirm installation with `which -a bash` (expect 2 results now)
1. Confirm the version of the newly installed bash with `/path/to/bash --version`

The updated bash should come before the bundled bash, which can be tested by checking the output of `bash --version` shows the updated version information.

### Make Updated bash the default login shell

UNIX systems have a security feature that limits which shells can be configured as login shells.
To add the updated bash to the whitelist:

1. Open `/etc/shells` (requires `sudo`) 
1. Add the path to the updated bash executable to the list of shells

Similar to the previous step, change the default shell from the older bash to the updated bash:

1. Run `chsh -s /path/to/updated/bash`
1. Run `sudo chsh -s /path/to/updated/bash` to change the default shell for the root user too
1. Close any terminals you have open to ensure all your terminals are using the new version

### Ensuring the new version is used
Any bash scripts that have their shebang set to `#!/bin/bash` are hardcoded to use the old version.

macOS's System Integrity Protection (SIP) prevents edits to `/bin/`, so without messing around with recovery mode and disabling that, you can't change `/bin/bash` to point to the updated bash.

I'm not prepared to do that, as I want to avoid tinkering with security features.

The best workaround is to use a more portable shebang: `#!/usr/bin/env bash`  
This will locate the program to execute whilst respecting the `PATH` environment variable, and will find the correct version of bash.

If you have scripts written by other people, you can run them using the correct version of bash by explicitly explicitly executing them.  
E.g. `$ bash third_party_script.sh`


## Install extra packages
 
 1. `brew install git bash-completion@2`
   * The bundled version of git is current, but doesn't include the git-prompt script that enables embedded git status info in the command prompt
