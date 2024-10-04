Cloud = Object:extend()

function Cloud:new()
  self.image = love.graphics.newImage("img/cloud.png")
end

function Cloud:draw()
  -- love.graphics.draw( image, x, y , rotation, xScale , yScale)
  love.graphics.draw(self.image, 20, 20, 0, 0.3, 0.3)
end