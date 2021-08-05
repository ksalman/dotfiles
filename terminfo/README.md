Need to install tmux terminfo for tmux-245color and italics to work
```sh
# Install
tic -o ~/.terminfo tmux-256color.terminfo

# Test italics
echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso`
```

Run this script outside and inside of tmux to confirm 24 bit colors.
```sh
curl https://raw.githubusercontent.com/ksalman/dotfiles/master/terminfo/24-bit-color.sh | bash
```

vim - :checkhealth and look at tmux section
