Need to install tmux terminfo for tmux-245color and italics to work
```sh
# Install
tic -o ~/.terminfo tmux-256color.terminfo

# Test italics
echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso`
```
