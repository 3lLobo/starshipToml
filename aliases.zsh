# Function to auto-setup and activate a venv
vnv() {
    if [ ! -d ".venv" ]; then
        python3 -m venv .venv
    fi
    if [ -f ".venv/bin/activate" ]; then
        source .venv/bin/activate
    fi
}

# Ping
alias pingg='ping -c 5 google.com'
alias pingh='ping -c 5 github.com'

# Nvidia Gpu fix
alias fix-gpu='sudo dkms autoinstall && sudo modprobe nvidia'
