function love.load()
  -- Add classic library by rxi, a tiny class module
  Object = require "classic"

  require "cloud"
  require "basket"

  cloud = Cloud()
  basket = Basket()

end

function love.update(dt)

  cloud:update(dt)
  basket:update(dt)

end

function love.draw()
  cloud:draw()
  basket:draw()
end