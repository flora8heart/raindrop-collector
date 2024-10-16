local Cloud = Object:extend()

-- Set scale of cloud image
local scale = 0.3
-- After setInterval time has passed, trigger the raindrop event
local setInterval = 0.6
-- Get initialTime before setInterval time has passed
local initialTime = love.timer.getTime( )

function Cloud:new()
  self.image = love.graphics.newImage("img/cloud.png")
  self.x = 20
  self.y = 20
  self.speed = 100
  self.width = (self.image:getWidth()) * scale -- remember to multiple by the scale value to get the new width value
  self.height = (self.image:getHeight()) * scale
  self.__objectName = "Cloud" --for print debugging
end

function Cloud:update(dt, score)
  -- Increase cloud speed after a certain amount of score
  -- increaseSpeed(score, scoreThreshold, speedIncreaseAmount)
  self:increaseSpeed(score, 5, 100)

  -- Add movement to cloud
  self.x = self.x + self.speed * dt
  -- print("self.x = ", self.x)

  -- Prevent edge of window collision
  -- Get window width
  local window_width = love.graphics.getWidth()

  -- Prevent collision to left of window
  if self.x < 0 then
    self.x = 0
    -- go opposite direction after hitting the edge of window
    self.speed = -self.speed
  -- Prevent collision to right of window
  elseif self.x + self.width > window_width then
    self.x = window_width - self.width
    -- go opposite direction after hitting the edge of window
    self.speed = -self.speed
  end

  -- Get current time 
  local currentTime = love.timer.getTime( )

  -- After setInterval time has passed, trigger the event of adding raindrop to listofRaindrops
  if currentTime - initialTime > setInterval then
    -- Add raindrops to listOfRaindrops. The position of Cloud is passed into raindrop.
    table.insert(listOfRaindrops, Raindrop(self.x, self.y))
    initialTime = love.timer.getTime( )
  end
end

function Cloud:draw()
  -- love.graphics.draw( image, x, y , rotation, xScale , yScale)
  love.graphics.draw(self.image, self.x, self.y, 0, scale, scale)
end

return Cloud