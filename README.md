# nvim-sops

**nvim-sops** is a lua plugin for neovim that wraps the [SOPS](https://github.com/mozilla/sops) commandline tool.

It was partly inspired by [the vscode extension by sinageos](https://github.com/signageos/vscode-sops) though it does not yet implement any of the realtime editing features and automatic creation features.

## Features

- Exposes `SopsEncrypt` and `SopsDecrypt` commands that can be used in neovim or bound to keymaps
- These commands perform an in-place encryption or decryption, saving and refreshing the buffer
- It is possible to add settings to override your `AWS_PROFILE`, `SOPS_AGE_KEY_FILE` or `GOOGLE_APPLICATION_CREDENTIALS` within neovim
- It also has a `debug` option to print much more information

## Requirements
- The plugin expects you to have the `sops` commandline tool. You can get it here: https://github.com/mozilla/sops/releases
- It expects the binary to be on your `$PATH`, but optionally it can set a custom path in the opts
- It also expects you to have your preferred key set up, but it leans on the env vars to get this

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'lucidph3nx/nvim-sops',
  event = { 'BufEnter' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}
```
### [packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'lucidph3nx/nvim-sops',
  config = function()
    require('nvim_sops').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
```

## Configuration

nvim-sops comes with the following defaults

```lua
{
    enabled = true
    debug = false
    binPath = 'sops' -- assumes its on $PATH
    defaults = { -- overriding any env vars as needed
        awsProfile = 'AWS_PROFILE',
        ageKeyFile = 'SOPS_AGE_KEY_FILE',
        gcpCredentialsPath = 'GOOGLE_APPLICATION_CREDENTIALS',
    }
}
```

## Keymaps
nvim-sops doesnt come with any default keybindings, it only has the vim commands.

Personally, I use the following keys and include them in my lazy.nvim definition above 

```lua
  keys = {
    { '<leader>ef', vim.cmd.SopsEncrypt, desc = '[E]ncrypt [F]ile' },
    { '<leader>df', vim.cmd.SopsDecrypt, desc = '[D]ecrypt [F]ile' },
  },
```
