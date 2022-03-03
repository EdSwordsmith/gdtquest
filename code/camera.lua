camera = {}

function camera:init()
    self.x = 128
    self.y = 128
    self.w = 256
    self.h = 256
end

function camera:apply()
    local x = self.x - self.w / 2
    local y = self.y - self.h / 2
    love.graphics.push()
    love.graphics.translate(-x, -y)
end
