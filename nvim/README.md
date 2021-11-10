# Python development

## MacOS
We need to set up a few things:
* Need pyright language server
    ```
    brew install nvim pyright
    ```
* Setup a venv and install pynvim for neovim to use. The location is set in my neovim config file
    ```
    python3 -m venv ~/.vim/pynvim
    source ~/.vim/pynvim/bin/activate
    pip install neovim
    ```

## Ubuntu
We need to set up a few things:
* Get latest version of neovim from https://github.com/neovim/neovim/wiki/Installing-Neovim
* Need pyright language server
    Install latest version of node from https://github.com/nodesource/distributions#deb
    ```
    curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
    sudo apt-get install -y nodejs

    npm install pyright

    ```
* Setup a venv and install pynvim for neovim to use. The location is set in my neovim config file
    ```
    python3 -m venv ~/.vim/pynvim
    source ~/.vim/pynvim/bin/activate
    pip install neovim
    ```
* Run neovim
    ```
    PATH=$PATH:~/node_modules/.bin/ ~/nvim.appimage
    ```
