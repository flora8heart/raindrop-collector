Basket = Object:extend()

local scale = 0.25

function Basket:new()
  self.image = love.graphics.newImage("img/basket.png")
  self.x = 10
  self.y = 440
  self.speed = 200
  -- set basket min boundary
  self.min = 10
  -- set basket max boundary
  self.max = love.graphics.getWidth() - self.min
  self.width = (self.image:getWidth()) * scale -- remember to multiple by the scale value to get the new width value
  self.height = (self.image:getHeight()) * scale
  self.previousScore = 0
end

function Basket:update(dt)
  -- Increase basket speed after a certain amount of score
  local scoreThreshold = 8
  local speedIncreaseAmount = 200

  if score - self.previousScore >= scoreThreshold then
    if self.speed > 0 then
      self.speed = self.speed + speedIncreaseAmount
    elseif self.speed < 0 then
      self.speed = self.speed - speedIncreaseAmount
    end

    print("basket self.speed", self.speed)
    self.previousScore = score
  end

  -- Add controls to basket
  -- Use dt to offset different computer framerate
  if love.keyboard.isDown("right", "d") then
    self.x = self.x + self.speed * dt
  elseif love.keyboard.isDown("left", "a") then
    self.x = self.x - self.speed * dt
  end

  -- Set basket movement boundaries
  -- Get window width
  local window_width = love.graphics.getWidth()

  -- Prevent basket moving past left boundary
  if self.x < self.min then
    self.x = self.min
    -- print(self.min, self.x)
  -- Prevent basket moving past right boundary
  elseif self.x > self.max - self.width then
    self.x = self.max - self.width
    -- print(self.x, self.max)
  end
end

function Basket:draw()
  -- love.graphics.draw( image, x, y , rotation, xScale , yScale
  love.graphics.draw(self.image, self.x, self.y, 0, scale, scale)
end