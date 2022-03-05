finishscene = {}

function finishscene:update(dt)
    if love.keyboard.isDown('return') then
        scene_manager:enter(gamescene)
    end
end

function finishscene:draw()
    push:start()
    map:draw()
    push:finish()

    local message = "You died " .. map.deaths .. " time"
    if map.deaths ~= 1 then
        message = message .. "s"
    end

    love.graphics.setFont(big_font)
    love.graphics.print(message, 0, 0)
    love.graphics.setFont(small_font)
    love.graphics.print('Press Enter to play again', 0, 100)
end
