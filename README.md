Windows setup (vundle and vimrc):
  * install git + git bash from https://code.google.com/p/msysgit/downloads/list?q=full+installer+official+git
  * set up ssh keys at %userprofile%\.ssh - optional?
  * run git bash
    * cd $HOME
    * git clone https://github.com/ksalman/dotfiles.git dotfiles
    * mkdir vimfiles
    * git clone https://github.com/gmarik/vundle.git vimfiles/bundle/vundle
    * echo "source $HOME/dotfiles/vimrc" > _vimrc
    * fire up gvim, :BundleList, and install the rest of the bundles

Linux setup (vundle and vimrc):
  * git clone https://github.com/ksalman/dotfiles.git ~/dotfiles
  * git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  * ln -s ~/dotfiles/vimrc ~/.vimrc
  * fire up gvim, :BundleList, and install the rest of the bundles
