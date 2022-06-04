local logger = require 'scnvim._extensions.logger.main'

return require'scnvim'.register_extension {
  --- The setup function will run when the user loads the extension.
  --- It will receive the extension config as the first argument and the user config as the second.
  --- It is acceptable to override values in the user_config object.
  ---
  --- The extension config is specified in the scnvim.setup function.
  ---
  --- scnvim.setup{
  ---   extensions = {
  ---     logger = {
  ---       path = '/tmp/my-log.txt',
  ---     },
  ---   },
  --- }
  setup = function(ext_config, user_config)
    logger.path = ext_config.path or '/tmp/sclang-log.txt'
  end,

  --- This is the public API of this plugin. Try not to break it :)
  ---
  --- The exported functions will be accessible from `SCNvimExt <name>.<command> <args>`
  --- Example: :SCnvimExt logger.start
  --- Example: :SCnvimExt logger.start w+ /tmp/log.txt
  ---
  --- Note: args will be quoted by default, so no need to wrap them in ""
  exports = {
    start = logger.start,
    stop = logger.stop,
  }
}
