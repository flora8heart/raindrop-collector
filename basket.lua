Basket = Object:extend()

function Basket:new()
  -- Create basket variable and set x to 0
  self.x = 10
  self.speed = 100
  -- set basket min starting location
  self.min = 10
  self.max = love.graphics.getWidth()
end

function Basket:update(dt)
  -- Add controls to basket
  -- Use dt to offset different computer framerate
  if love.keyboard.isDown("right", "d") then
    -- add right wall boundary
    if self.x >= self.min and self.x < self.max - (self.speed + self.min) then
      self.x = self.x + self.speed * dt
      print(self.x)
    end
  elseif love.keyboard.isDown("left", "a") then
    -- add left wall boundary
    if self.x - self.speed > 0 then
      self.x = self.x - self.speed * dt
      print(self.x)
    else
      -- use math.max to create fuzziness zone so the min value is at self.min, this is to ensure that basket doesn't automatically snap to the minimum position.
      if self.x - self.speed < 0 then
        self.x = math.max(self.min, self.x - 100 * dt)
        print(self.x)
      end
    end
  end
end

function Basket:draw()
  love.graphics.rectangle("line", self.x, 500, 100, 50)
end