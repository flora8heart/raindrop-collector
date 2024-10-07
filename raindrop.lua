Raindrop = Object:extend()

local scale = 0.04

function Raindrop:new()
  self.image = love.graphics.newImage("img/rain-drop.png")
  self.x = 50
  self.y = 140
  self.width = (self.image:getWidth()) * scale -- remember to multiple by the scale value to get the new width value
  self.height = (self.image:getHeight()) * scale
end

function Raindrop:draw()
  love.graphics.draw(self.image, self.x, self.y, 0, scale, scale)
end