# HomeDashboard
I wanted to make my extended calender as well as long term todo list visible at home via a dashboard. Having something that could be mounted in the kitchen seemed like a good idea and since it was going to be a screen why not make it into a photo frame as well.

## Hardware
* Raspberry Pi 3B+
* Old Dell 1080p HDMI Monitor

## Software
* Raspberry Pi OS
* vc4-kms-v3d driver
* Chromium
* ElementHider Chrome Extension

## Usage
1. Transfer the scripts folder to the Raspberry Pi. They should be in `~/Documents/scripts`. This can be done easily with scp.
2. Rename `env-example.sh` to `env.sh` and update the values accordingly.
3. Modify `open-windows.sh` to have the correct parameters for user and verify that it is using the `env.sh` parameters correctly
4. Add any photos you want for the photo frame to `~/Pictures/screensaver` on the Raspberry Pi.
5. Update crontab on the Raspberry Pi per the directions in `crontab.md`
6. Download and install the ElementHider Extension for Chrome and add the rules per the `elementhider-rules.md` file.
7. The display driver may need to be updated to get `xset` working correctly. I think it has something to do with the vc4-kms-v3d driver.
8. Reboot the Raspberry Pi.
9. You'll need a mouse to right click the top bar of the chrome windows and select `Un/Decorate` to maximize screen real estate. I think there is a way to automate this, but I haven't figured it out yet.

## Additional Notes
### Updating xset
Some setup is required in order for the `screen-on.sh` and `screen-off.sh` scripts to work. The below is only necessary if you aren't running the `xset.sh` script on boot via crontab and is provided as additional context for troubleshooting.

1. Make sure that Raspberry Pi Configuration > Display > Screen Blanking is set to on.
2. Disable the `xset` Screen Saver timeout and cycle by setting their values to zero with `DISPLAY=:0 xset s 0 0`
    - The timeout, in seconds, controls after how long without activity the screen saver will come on.
    - The cycle, in seconds, controls how often the screen saver image will change.
    - We are using feh as out screen saver so the cycle time doesn't matter and we want to make sure the default screen saver doesn't trigger after inactivity so we set timeout to max.
3. Disable the `xset` DPMS (Energy Star) standby, suspend and off by setting their values to zero with `DISPLAY=:0 xset dpms 0 0 0`
    - Doing this makes sure that the screen won't blank, but will still allow us to use `xset dpms force on` and `xset dpms force off` to control when the screen turns on and off for the day.
4. These settings will be cleared on reboot