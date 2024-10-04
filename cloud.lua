Cloud = Object:extend()

local scale = 0.3

function Cloud:new()
  self.image = love.graphics.newImage("img/cloud.png")
  self.x = 20
  self.y = 20
  self.speed = 100
  self.width = (self.image:getWidth()) * scale -- remember to multiple by the scale value to get the new width value
  self.height = (self.image:getHeight()) * scale
end

function Cloud:update(dt)
  -- Add movement to cloud
  self.x = self.x + self.speed * dt
  -- print("self.x = ", self.x)

  -- Prevent edge of window collision
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
end


function Cloud:draw()
  -- love.graphics.draw( image, x, y , rotation, xScale , yScale)
  love.graphics.draw(self.image, self.x, self.y, 0, scale, scale)
end