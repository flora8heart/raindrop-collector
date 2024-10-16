-- Set up global variables within the scope of the game files.
local score = 0 -- score counter
local sounds = {}
local cloud, basket
local gameState = "intro" -- Set initial game state

function love.load()
  -- Add classic library by rxi, a tiny class module
  Object = require "classicExtra"

  local Cloud = require "cloud"
  local Basket = require "basket"
  require "raindrop"
  
  sounds.raindrop = love.audio.newSource("sound/collision.wav", "static")
  sounds.music = love.audio.newSource("sound/rainfall.wav", "stream")
  sounds.music:setLooping(true) -- set background music to true

  cloud = Cloud()
  basket = Basket()
  -- Tablet storing raindrops drawn
  listOfRaindrops = {}

  -- Store how many raindrop has been missed
  missedRaindropCounter = 0

  -- set font size for score
  scoreFont = love.graphics.newFont(20)

  -- set background
  love.graphics.setBackgroundColor(240/255, 248/255, 255/255)

  -- Plays blackground music
  sounds.music:play()

  -- set font size for intro
  introFont = love.graphics.newFont(40)
  titleFont = love.graphics.newFont(60)

end

function love.update(dt)
  -- if game state is intro -> conditions to run intro screen
  if gameState == "intro" then
    if love.keyboard.isDown("return", "space") then
      gameState = "playing"
    end
  -- if game state is playing --> conditions to run playing screen
  elseif gameState == "playing" then
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
end

function love.draw()
  -- If gameState is intro then draw intro splash screen
  if gameState == "intro" then
    
    love.graphics.setColor(25/255,25/255,112/255)
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    -- Draw game title
    love.graphics.setFont(titleFont)
    local gameTitle = "Raindrop Collector"
    love.graphics.printf(gameTitle, 0, 100, width, "center")

    --Draw game instruction
    love.graphics.setFont(introFont)
    local gameInstruction = "Press Enter or Space to Start"
    love.graphics.printf(gameInstruction, 0, height / 2, width, "center")

    love.graphics.setColor(1, 1, 1) -- Reset color to white
  
    -- Draw basket for intro
    local scale = 0.3
    local basketArt = love.graphics.newImage("img/basket.png")
    -- love.graphics.draw( image, x, y , rotation, xScale , yScale
    local basketArtHeight = basketArt:getHeight() * scale
    local basketArtWidth = basketArt:getWidth() * scale
    love.graphics.draw(basketArt, width / 2 - basketArtWidth / 2, height - basketArtHeight - 20, 0, scale, scale)
    
  -- else if gameState is playing then draw playing screen
  elseif gameState == "playing" then
    cloud:draw()
    basket:draw()

    -- iterate through listOfRaindrops and draw the raindrops that was added to listOfRaindrops
    for i, v in ipairs(listOfRaindrops) do
      v:draw()
    end

    -- Display score counter
    love.graphics.setFont(scoreFont)
    love.graphics.setColor(25/255,25/255,112/255) -- set font color to midnight blue, divded by 255 for rgb to love2d color code conversion as it's now between 1 and 0
    love.graphics.print("Score: "..score, 10, 10)
    love.graphics.print("Missed: "..missedRaindropCounter, 680, 10)
    
    -- Reset color to white for the rest of the elements
    love.graphics.setColor(1, 1, 1)

    -- Set the threshold of raindrops that missed the basket, which will then be used to trigger a game reset or game over.
    local missedBasketThreshold = 5

    -- Reload game after 5 raindrops are missed.
    if missedRaindropCounter > missedBasketThreshold then
      sounds.music:stop() -- stop playing music when game over
      love.load()
    end
  end
end