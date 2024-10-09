Raindrop = Object:extend()

local scale = 0.04

function Raindrop:new(x, y)
  self.image = love.graphics.newImage("img/rain-drop.png")
  self.x = x + 50 --70
  self.y = y + 120 --140
  self.speed = 800
  self.width = (self.image:getWidth()) * scale -- remember to multiple by the scale value to get the new width value
  self.height = (self.image:getHeight()) * scale
end

function Raindrop:update(dt)
  -- Add vertical movement to raindrop
  self.y = self.y + self.speed * dt
end

function Raindrop:draw()
  love.graphics.draw(self.image, self.x, self.y, 0, scale, scale)
end