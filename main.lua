function love.load()
  -- Add classic library by rxi, a tiny class module
  Object = require "classic"

  require "cloud"
  require "basket"
  require "raindrop"

  cloud = Cloud()
  basket = Basket()
  -- Tablet storing raindrops drawn
  listOfRaindrops = {}
end

function love.update(dt)
  cloud:update(dt)
  basket:update(dt)

  -- iterate through listOfRaindrops and update raindrop in listOfRaindrops
  for i, v in ipairs(listOfRaindrops) do
    -- print("v", v)
    v:update(dt)

    -- Check collision of raindrop with basket
    v:checkCollision(basket)
  end
end

function love.draw()
  cloud:draw()
  basket:draw()

  -- iterate through listOfRaindrops and draw the raindrops that was added to listOfRaindrops
  for i, v in ipairs(listOfRaindrops) do
    v:draw()
  end
  
end