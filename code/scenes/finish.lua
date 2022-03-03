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

    local screen_width = love.graphics.getWidth()
    love.graphics.setFont(big_font)
    love.graphics.printf(message, 0, 100, screen_width, 'center')
    love.graphics.setFont(small_font)
    love.graphics.printf('Press Enter to play again', 0, 300, screen_width, 'center')
end
