-- Add extra shared modules to be used alongside classic module.
local Object = require("classic")

-- Add increase speed logic function to object
function Object:increaseSpeed(score, scoreThreshold, speedIncreaseAmount)
  -- Initialise self.previousScore
  if self.previousScore == nil then
    self.previousScore = 0
  end

  if score - self.previousScore >= scoreThreshold then
    if self.speed > 0 then
      self.speed = self.speed + speedIncreaseAmount
    elseif self.speed < 0 then
      self.speed = self.speed - speedIncreaseAmount
    end
    print(self.__objectName .. " self.speed", self.speed)
    self.previousScore = score
    self.previousScore = score
  end
end

return Object