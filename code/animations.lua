animations = {}

function animations:load()
    self.image = love.graphics.newImage('assets/Tilemap/characters_packed.png')
    self.grid = anim8.newGrid(24, 24, animations.image:getWidth(), animations.image:getHeight())
    self.offset_x, self.offset_y = 12, 12
end

function animations:player()
    return anim8.newAnimation(self.grid('1-2', 1), 0.3)
end
