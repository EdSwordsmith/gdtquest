local gamescene = require 'code.scenes.game'

local startscene = {}

function startscene:update(dt)
    if love.keyboard.isDown('return') then
        scene_manager:enter(gamescene)
    end
end

function startscene:draw()
    local screen_width = love.graphics.getWidth()
    love.graphics.setBackgroundColor(0, 0.2, 0.7, 1)
    love.graphics.setFont(big_font)
    love.graphics.printf('The Quest', 0, 100, screen_width, 'center')
    love.graphics.setFont(small_font)
    love.graphics.printf('Press Enter to continue', 0, 300, screen_width, 'center')
end

return startscene