function love.load()
  -- Create basket variable and set x to 0
  basket = {}
  basket.x = 10
  basket.speed = 100
  basket.min = 10
  basket.max = love.graphics.getWidth()
end

function love.update(dt)

  movingBasket(dt)

end

function love.draw()
  love.graphics.rectangle("line", basket.x, 500, 100, 50)
end

function movingBasket(dt)
  -- Make basket move left to right

  -- Use dt to offset different computer framerate
  if love.keyboard.isDown("right", "d") then
    -- add right wall boundary
    if basket.x >= basket.min and basket.x < basket.max - (basket.speed + basket.min) then
      basket.x = basket.x + basket.speed * dt
      print(basket.x)
    end
  elseif love.keyboard.isDown("left", "a") then
    -- add left wall boundary
    if basket.x - basket.speed > 0 then
      basket.x = basket.x - basket.speed * dt
      print(basket.x)
    else
      -- use math.max to create fuzziness zone so the min value is at basket.min, this is to ensure that basket doesn't automatically snap to the minimum position.
      if basket.x - basket.speed < 0 then
        basket.x = math.max(basket.min, basket.x - 100 * dt)
        print(basket.x)
      end
    end
  end
end