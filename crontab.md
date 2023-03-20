# Update crontab
1. Open crontab to edit with `sudo crontab -e`
2. Add the below lines to the bottom of the file:
```
@reboot sleep 120 && sh ~/Documents/scripts/open-windows.sh
@reboot sleep 120 && sh ~/Documents/scripts/xset.sh
0 8 * * * sh ~/Documents/scripts/screen_on.sh
0 22 * * * sh ~/Documents/scripts/screen_off.sh
15 8-17 * * * sh ~/Documents/scripts/slideshow_start.sh
0 9-18 * * * sh ~/Documents/scripts/slideshow_end.sh
15 20-21 * * * sh ~/Documents/scripts/slideshow_start.sh
0 21-22 * * * sh ~/Documents/scripts/slideshow_end.sh
```
3. Press `esc` and then `:wq` to save and quit

## Explanation
The above rules do the following:
- Opens the chromium windows on boot
- Configures `xset` on boot
- Turns the screen on at 8am
- Turns the screen off at 10pm
- Starts the photo slideshow on the 15th minute of every hour from 8am until 5pm then 8pm to 9pm.
- Stops the photo slideshow at the top of the hour of every hour from 9am until 6pm then 9pm to 10pm.
