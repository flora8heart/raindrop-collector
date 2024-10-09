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

-- Check collision using the AABB method (Axis-Aligned Bounding Box) 
-- The 4 conditions for collisions are: 
-- Let Box 1 has the following variables: x1, y1, w1 as width, h1 as height
-- Box 1 is raindrop
-- Let Box 2 has the the following variables: x2, y2, w2 as width, h2 as height
-- Box 2 is basket
-- 1. Box 1 right side is further to the right than Box 2 left side 
-- x1 + w1 > x2
-- 2. Box 1 left side is further to the left than Box 2 right side
-- x1 < x2 + w2
-- 3. Box 1 bottom side is further to the bottom than Box 2 top side
-- y1 + h1 > y2
-- 4. Box 1 top side is further to the top than Box 2 bottom side
-- y1 < y2 + h2

function Raindrop:checkCollision(basket)
  -- print("Test checkCollision function!")
  local x1, y1, w1, h1 = self.x, self.y, self.width, self.height
  local x2, y2, w2, h2 = basket.x, basket.y, basket.width, basket.height
  -- print("Raindrop x, y, w, h:", x1, y1, w1, h1)
  -- print("Basket x, y, w, h:", x2, y2, w2, h2)
  if x1 + w1 > x2 and
     x1 < x2 + w2 and
     y1 + h1 > y2 and
     y1 < y2 + h2 then
      self.collision = true
      -- print("Collision!!!!")
  else
      self.collision = false
  end
end