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

# Auto mount USB drive
usbmnt() {
    # 1. Assign the first argument to a local variable
    local DEVICE=$1

    # 2. Validation: check if an argument was provided
    if [[ -z "$DEVICE" ]]; then
        echo "Error: Please provide a device path (e.g., usbmnt /dev/sdb1)"
        return 1
    fi

    # 3. Validation: check if the device actually exists
    if [[ ! -b "$DEVICE" ]]; then
        echo "Error: Device $DEVICE not found or is not a block device."
        return 1
    fi

    # 4. Extract the Label. If empty, use 'usb_drive' as a fallback.
    local LABEL=$(lsblk -dno LABEL "$DEVICE")
    local NAME=${LABEL:-"usb_drive"}
    local MOUNT_PATH="/mnt/$NAME"

    # 5. Create directory and mount
    echo "Attempting to mount $DEVICE to $MOUNT_PATH..."
    sudo mkdir -p "$MOUNT_PATH"
    
    if sudo mount "$DEVICE" "$MOUNT_PATH"; then
        echo "Success: $DEVICE is now mounted at $MOUNT_PATH"
        lsblk "$DEVICE"
    else
        echo "Error: Failed to mount $DEVICE."
        return 1
    fi
}

