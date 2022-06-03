local sclang = require 'scnvim.sclang'
local action = require 'scnvim.action'

return require'scnvim'.register_extension {
  setup = function(ext_config, user_config)
    -- P('ext', ext_config)
    -- P('user', user_config)

    sclang.on_post:append(function(line)
      print(line)
    end)
  end,
  exports = {
    start = function()
      print('logger start.')
    end,
    stop = function()
      print('logger stop.')
    end,
  }
}
