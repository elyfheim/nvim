# Neovim Configuration

A personal neovim configuration for neovim [v0.12.1](https://github.com/neovim/neovim/releases/tag/v0.12.1). I try to keep my plugin usage low, I only include plugins that I personally think are useful for me (this might not be the same for other people).

## Dependencies

I use NixOS to manage packages on my main computer, but I still use good ol' configuration files using home manager's `MkOutOfStoreSymlink` to _symlink_ them to the appropriate directory. This allows me to decouple my configuration files from Nix itself making it accessible to my other machines where I don't use Nix as my package manager. With that being said, to use this neovim configuration you do need to install formatters, language servers, and other dependencies yourself since I manage mine using Nix. Here are the packages needed for this configuration to run properly:
|package name|
|--|
|tree-sitter-cli **(v0.26.8+)**|
|lua-language-server|
|stylua|
|nil|
|typescript-language-server|
|clang-tools|
|qml language server|
|ripgrep|
|fzf|

Make sure to install them with your favorite package manager on your system!

## Installation

You need neovim [v0.12.1](https://github.com/neovim/neovim/releases/tag/v0.12.1) or later, this won't work on older version since it uses the native `vim.pack` package manager. After installing neovim, you can clone this repo and put it inside your `.config` directory. Open neovim and let `vim.pack` do its magic and you got yourself a really nice text editor! :).

## Plugins

I try to not use too many plugins, I don't like having dependencies to be perfectly honest. But these are the ones I find crucial for my workflow.
|plugin name|description|
|--|--|
|[rose-pine](https://github.com/rose-pine/neovim)|color scheme|
|[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)|treesitter queries and parsers|
|[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)|LSP configuration|
|[blink.cmp](https://github.com/saghen/blink.cmp)|suggestions and autocomplete|
|[lazydev.nvim](https://github.com/folke/lazydev.nvim)|faster LuaLS setup|
|[mini.files](https://github.com/nvim-mini/mini.files)|preferred file manager inside neovim|
|[conform.nvim](https://github.com/stevearc/conform.nvim)|formatter|
|[nvim-autopairs](https://github.com/windwp/nvim-autopairs)||
|[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)|pretty status line|
|[flash.nvim](https://github.com/folke/flash.nvim)|essential jumping plugin|
|[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)||
|[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)||
|[telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)||
|[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)|essential finder|
|[neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)|smooth scrolling|
|[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)||

## Keybindings

To Do

## Acknowledgments

I started learning to configure my neovim from [kickstart](https://github.com/nvim-lua/kickstart.nvim) and I couldn't have done it without them!. I also learned a lot by reading countless configurations from other people which I honestly think is one of the best way to understand how it really works.
