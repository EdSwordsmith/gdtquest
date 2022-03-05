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

    love.graphics.setFont(big_font)
    love.graphics.print('The Quest', 0, 0)
    love.graphics.setFont(small_font)
    love.graphics.print('Press Enter to continue', 0, 100)
end
