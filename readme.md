# helloworld.nvim

A simple Neovim plugin that shows a popup message.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "yourusername/helloworld.nvim",
    config = function()
        require("helloworld").setup()
    end
}
