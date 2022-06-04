# scnvim logger

Log post window ouput to a file with timestamps.

This project serves as an example implementation for a scnvim extension.

Skip to the [developing](#developing) section to learn more!

## Installation

* Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { 'davidgranstrom/scnvim-logger' }
```

* Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'davidgranstrom/scnvim-logger'
```

Load the extension **after** the call to `scnvim.setup`.

```lua
scnvim.setup{...}

scnvim.load_extension('logger')
```

## Usage

Start logging

```vim
:SCNvimExt logger.start
```

You can override the default behaviour by passing arguments for mode and path.

```vim
:SCNvimExt logger.start a+ /tmp/my-log.txt
```

Stop logging

```
:SCNvimExt logger.stop
```

## Configuration

```lua
scnvim.setup {
  extensions = {
    logger = {
      path = '/tmp/my-log.txt',
    },
  },
}
```


# Developing

The scnvim extension API is *heavily* inspired by the awesome
[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim), so if you
already know how write a telescope extension you will feel right at home!


## Directory layout

To make the extension a compatible scnvim extension the directory layout should match the following.

```
.
├── README.md                 # Instructions for your extension
└── lua
    └── scnvim
        └── _extensions       # (note the underscore!)
            ├── logger        # Business logic goes here, can be split into more files.
            │   └── main.lua
            └── logger.lua    # Name of the extension

```

The name of the extension in this case is `logger`, and to load the extension a
user will call `scnvim.load_extension('logger')` after the initial call to
`scnvim.setup`.

## Configuration

The extension will receive its own configuration as well as the user config. It
is acceptable to modify the user config if necessary, and some extensions might
only be a "preset" of a user config.

The extension's own configuration is defined in the table given to `scnvim.setup`.

```lua
scnvim.setup{
  extensions = {
    logger = {
      path = '/tmp/sclang-log.txt'
    },
  },
}
```
