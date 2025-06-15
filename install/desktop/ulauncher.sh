yay -S --needed ulauncher --noconfirm

# Create ulauncher config directory if it doesn't exist
mkdir -p ~/.config/ulauncher/

# Start ulauncher to have it populate config before we overwrite
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 5 # ensure enough time for ulauncher to set defaults

# Check if ulauncher is running
if pgrep -x "ulauncher" > /dev/null; then
  echo "Ulauncher is running, copying settings..."
else
  echo "Ulauncher is not running, starting it again..."
  gtk-launch ulauncher.desktop >/dev/null 2>&1
  sleep 5 # give it more time to start
fi

# Copy settings file
cp ~/.local/share/omakub/configs/ulauncher.json ~/.config/ulauncher/settings.json
