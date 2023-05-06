# Makes you feel at home on any machine 💫

## Starship 🚀

A pretty Terminal is a must!
On windows or WSL install the Nerd Font in Windows Fonts.
On Linux make sure `fc-cache` is installed.

```bash
./installNerdFonts.sh
./installStarship.sh
```

## Bash Zsh profile

Pulse all custom settings and aliases from `.bashrc` to the `.profile` file.

Then add in `.bashrc`:
  
```vim
  source ~/.profile
```

In `.zshrc`:

```vim
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

fpath+=~/.zfunc
autoload -Uz compinit && compinit
```

Watch out for an infinite sourcing loop between `.bashrc` and `.profile`!

## Git

Set vim as default editor:

```bash
git config --global core.editor "vim"
```

Log in to GitHub:

```bash
git config --global user.name "Your Name"
git config --global user.email "
```

## Vim

Should be installed by default on Ubuntu.

### Install Vim

```bash
sudo apt-get install vim
```

## Rust ®️

The number one!!

### Cargo + Rustup

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Install Rust Analyzer

For the Rust Analyzer to work, the Rust source code must be installed:

```bash
rustup component add rust-src
```

Add the [Russ Analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer) to VS Code.


## Python 

Ok let's face it, we aint doing much in Rust. Python aint going anywhere.
Let's use the latest version, it's much faster and debugging has leveled up.

### Install Python 3.11

Get the download link for the latest official version of Python 3.11 from [here](https://www.python.org/downloads/source/)

Then install into `/usr/local`:

```bash
cd /usr/local/src
sudo wget https://www.python.org/ftp/python/3.11.3/Python-3.11.3.tgz
sudo tar xzf Python-3.11.3.tgz
cd Python-3.11.3
sudo ./configure --enable-optimizations
sudo make altinstall
```

Install pip3.11:

```bash
python3.11 -m ensurepip --upgrade
```

Now fix the symbolic link in `/usr/bin` to refer to the new version:

```bash
sudo rm /usr/bin/python3
sudo ln -s /usr/local/bin/python3.11 /usr/bin/python3
```

Same for pip3:

```bash
sudo rm /usr/bin/pip3
sudo ln -s /usr/local/bin/pip3.11 /usr/bin/pip3
```

### Poetry

Install Poetry with the new version of Python:

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

Add the completion to our zsh:

```bash
poetry completions zsh > ~/.zfunc/_poetry
```

## Node.js

For anything web related.

## NVM

For the latest version of NVM check the [official repo](https://github.com/nvm-sh/nvm#install--update-script).
  
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

Push the path to the `.profile` file:

```bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.profile
```

Install and use the ltm version of Node.js:

```bash
nvm install lts
nvm use lts
```

### Yarn

Install Yarn:

```bash
npm install --global yarn
```

## Install Docker

If you are on WSL2, install Docker Desktop for Windows and enable the WSL2 integration.

```bash
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
"deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Test
sudo docker run hello-world
```

## MiniKube

For Kubernetes development.

### Install MiniKube

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
```

### Install Kubectl

```bash
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```

### Install Helm

```bash
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
```
