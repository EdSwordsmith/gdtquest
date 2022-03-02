local player = {}

function player:init(world, x, y)
    self.x = x
    self.y = y
    self.dx = 0
    self.dy = 0
    self.world = world
    world:add(self, x, y, 16, 16)
end

function player:update(dt)

    
end

function player:draw()
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle('fill', self.x, self.y, 16, 16)
end

return player