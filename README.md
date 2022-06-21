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
├── README.md                      # Instructions for your extension
├── lua
│   └── scnvim
│       └── _extensions            # Note the underscore!
│           ├── logger
│           │   └── main.lua       # Business logic goes here, can be split into more files.
│           └── logger.lua         # Name of the extension
└── supercollider                  # This directory will be linked to the users Extensions directory
    └── scide_scnvim               # Note the `scide_scnvim` subdirectory!
        └── SCNvimExtLogger.sc     # Define SuperCollider classes here
```

The name of the extension in this case is `logger`, and to load the extension a
user will call `scnvim.load_extension('logger')` after the initial call to
`scnvim.setup`.

If there is a `supercollider` directory in the root of the plugin its content
will be automatically linked to the user's Extensions directory under
`scnvim-extensions/<name>`.

Please give user instructions on how to remove the class link, e.g.

> To uninstall the linked SuperCollider classes that comes with this plugin, delete the symbolic link found in `Extensions/scnvim-extensions/<name>`.
>
> The `Extensions` directory can opened from the IDE menu `File -> Open user support directory`

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
