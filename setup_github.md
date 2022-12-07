
Install Git Credential Manager https://github.com/GitCredentialManager/git-credential-manager/blob/main/README.md  
For macOS: 

* `brew tap microsoft/git`
* `brew install --cask git-credential-manager-core`
* This credential manager supports multifactor authentication, whereas the credential manager bundles with git does not.

Setup username and email address:

 * `git config --global user.name "FIRST_NAME LAST_NAME"`
 * `git config --global user.email "MY_NAME@example.com"`

## Setup Global .gitignore

The global .gitignore will apply to all repositories, but is actually per-user rather than truly global (i.e. all users)

* `git config --global core.excludesFile ~/bash_profile/.global_gitignore`



## Setting up HTTPS based accesss

GitHub recommends using HTTPS based URLs for remote repositories. Probably because HTTPS is less likely to be blocked by corporate firewalls ([detail on HTTPS vs SSH here](https://www.howtogeek.com/devops/should-you-use-https-or-ssh-for-git/)).  
Basic HTTP authentication has been blocked by GitHub, so setup now requires the use of a Personal Access Token.

Full docs: https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls

The docs say you need to use a personal access token, but if you use Git Credential Manager you will be given the option to login via the browser. Login via the browser is easier, so do that where possible.



## (Optionally) Install GitHub CLI
https://docs.github.com/en/github-cli/github-cli/about-github-cli  
https://cli.github.com/  

Run `brew install gh`

Manual: https://cli.github.com/manual/
