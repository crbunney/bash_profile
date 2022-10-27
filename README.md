My personal, basic bash profile configuation.

It's a convenient way of keeping a versioned backup of my preferred setup.

Being able to clone the repo onto new machines also makes it quicker to set them up.

# Requirements


# Installation

Simply clone the repo to your home directory, then symlink to the files it contains (that way, it's 
easy to push/pull updates to/from GitHub)

```bash
cd ~

git checkout https://github.com/crbunney/bash_profile.git

ln -s bash_profile/.bashrc
ln -s bash_profile/.bash_profile
```

There is further installation/setup, instructions can depend on the operating system, so they are given separately:
* [macOS](setup_macos.md)