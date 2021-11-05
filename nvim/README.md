# Python development
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
