local sclang = require 'scnvim.sclang'
local uv = vim.loop

local logger = {}

local function on_post(line)
  if not logger.handle then
    return
  end
  local s, ms = uv.gettimeofday()
  line = string.format('[%d.%d] %s\n', s, ms, line)
  logger.handle:write(line)
end

function logger.start(mode, path)
  logger.stop()
  path = path or logger.path
  mode = mode or 'w+'
  -- append action
  logger.action_id = sclang.on_output:append(on_post)
  logger.handle = io.open(path, mode)
end

function logger.stop()
  if logger.handle then
    logger.handle:close()
    logger.handle = nil
  end
  if logger.action_id then
    -- remove action
    sclang.on_output:remove(logger.action_id)
    logger.action_id = nil
  end
end


return logger
