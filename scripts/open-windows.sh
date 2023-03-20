# Open up a new chromium window

# $1 & $2 should be in the format of "w,h"
# $3 should be in the format of "https://example.com"
# $4 should be the user
# $5 should be an integer

# DISPLAY=:0 selects the default HDMI display for the RP3
# --window-size and --window-position are used to layout the window
# --user-data-dir is a hack used to allow multiple different sized and placed windows to open. If no user profile is used then a second window open directly on top of the first window.
source ./env.sh

open_window () {
  DISPLAY=:0 chromium-browser --window-size=$1 --window-position=$2 --app=$3 --user-data-dir="/home/$4/Documents/Profiles/$5"
}

# Opens Trello Window, see env.sh for values of variables
open_window $TRELLO_WINDOW_SIZE $TRELLO_WINDOW_LOCATION $TRELLO_URL $USER_DIR 1 &

# Sleeping for 30 seconds to give the above window time to load
sleep 30s

# Opens Google Calendar, see env.sh for values of variables
open_window $CALENDAR_WINDOW_SIZE $CALENDAR_WINDOW_LOCATION $CALENDAR_UR $USER_DIR 2 &