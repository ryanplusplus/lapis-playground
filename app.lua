local lapis = require('lapis')
local app = lapis.Application()

local p = function(t)
  print(require 'inspect'(t))
end

app:enable('etlua')

app:get('/', function()
  return { render = 'upload' }
end)

app:post('/upload', function(self)
  local data = self.params.data
  return data.filename .. '\n' .. data.content
end)

return app
