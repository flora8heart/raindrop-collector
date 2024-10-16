-- Set up global variables within the scope of the game files.
local score = 0 -- score counter

function love.load()
  -- Add classic library by rxi, a tiny class module
  Object = require "classicExtra"

  require "cloud"
  require "basket"
  require "raindrop"
  sounds = {}
  sounds.raindrop = love.audio.newSource("sound/collision.wav", "static")
  sounds.music = love.audio.newSource("sound/rainfall.wav", "stream")
  sounds.music:setLooping(true) -- set background music to true

  cloud = Cloud()
  basket = Basket()
  -- Tablet storing raindrops drawn
  listOfRaindrops = {}
  -- -- Score counter
  -- score = 0

  -- Store how many raindrop has been missed
  missedRaindropCounter = 0

  -- set font size
  font = love.graphics.newFont(20)
  love.graphics.setFont(font)

  -- set background
  love.graphics.setBackgroundColor(240/255, 248/255, 255/255)

  -- Plays blackground music
  sounds.music:play()

end

function love.update(dt)
  cloud:update(dt, score) -- passing score into cloud:update() to change cloud speed according to certain conditions
  basket:update(dt, score)

  -- iterate through listOfRaindrops and update raindrop in listOfRaindrops
  for i, v in ipairs(listOfRaindrops) do
    -- print("v", v)
    v:update(dt)

    -- Check collision of raindrop with basket
    v:checkCollision(basket)

    -- if collision is detected then remove raindrop
    if v.collision then
      sounds.raindrop:play()
      -- print("remove raindrop!")
      table.remove(listOfRaindrops, i)
      -- Update score counter
      score = score + 1
      print("score", score)
    end

    -- remove raindrop from screen if exceeds screen
    if v.missed then
      table.remove(listOfRaindrops, i)
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
  love.graphics.setColor(25/255,25/255,112/255) -- set font color to midnight blue, divded by 255 for rgb to love2d color code conversion as it's now between 1 and 0
  love.graphics.print("Score: "..score, 10, 10)
  love.graphics.print("Missed: "..missedRaindropCounter, 680, 10)
  
  -- Reset color to white for the rest of the elements
  love.graphics.setColor(1, 1, 1)
end