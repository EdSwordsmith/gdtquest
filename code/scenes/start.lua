startscene = {}

function startscene:enter(previous, ...)
    ldtk:goTo(1)
end

function startscene:update(dt)
    if love.keyboard.isDown('return') then
        scene_manager:enter(gamescene)
    end
end

function startscene:draw()
    push:start()
    map:draw()
    push:finish()

    local screen_width = love.graphics.getWidth()
    love.graphics.setFont(big_font)
    love.graphics.printf('The Quest', 0, 100, screen_width, 'center')
    love.graphics.setFont(small_font)
    love.graphics.printf('Press Enter to continue', 0, 300, screen_width, 'center')
end
