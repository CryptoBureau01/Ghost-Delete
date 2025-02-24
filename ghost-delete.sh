# !/bin/bash

Dalete-Ghost() {
    echo "Stopping and disabling Ghost node service..."
    sudo systemctl stop ghost-node
    sudo systemctl disable ghost-node
    sleep 1

    echo "Removing Ghost node service files..."
    sudo rm -rf /etc/systemd/system/ghost-node.service
    sudo systemctl daemon-reload
    sleep 1

    echo "Deleting Ghost node directories..."
    sudo rm -rf /root/ghost
    sudo rm -rf /etc/ghost
    sudo rm -rf /var/lib/ghost
    sudo rm -rf ghost.sh
    sleep 1

    echo "Removing Rust and Cargo..."
    sudo rm -rf $HOME/.cargo
    sudo rm -rf $HOME/.rustup
    sudo apt remove --purge -y rustc cargo
    sleep 1

    echo "Removing firewall rules..."
    sudo ufw delete allow 30333
    sudo ufw delete deny 9945
    sleep 1

    echo "Cleaning up system packages..."
    sudo apt autoremove -y
    sudo apt clean
    sleep 1

    echo "✅ Ghost full node deleted successfully!"
    sleep 1

    echo "🔄 Rebooting system for final cleanup..."
    sleep 3
    sudo reboot
}

# Run the function
Dalete-Ghost
