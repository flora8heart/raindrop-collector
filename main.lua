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
  -- Score counter
  score = 0

  -- set font size
  font = love.graphics.newFont(20)
  love.graphics.setFont(font)
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

    -- if collision is detected then remove raindrop
    if v.collision then
      -- print("remove raindrop!")
      table.remove(listOfRaindrops, i)
      -- Update score counter
      score = score + 1
      print("score", score)
    end
  end
end

function love.draw()
  cloud:draw()
  basket:draw()

  -- iterate through listOfRaindrops and draw the raindrops that was added to listOfRaindrops
  for i, v in ipairs(listOfRaindrops) do
    v:draw()
  end

  -- Display score counter
  love.graphics.setColor(217/255,155/255,130/255) -- set font color to salmon pink, divded by 255 for rgb to love2d color code conversion as it's now between 1 and 0
  love.graphics.print("Score: "..score, 10, 10)
  
  -- Reset color to white for the rest of the elements
  love.graphics.setColor(1, 1, 1)
end