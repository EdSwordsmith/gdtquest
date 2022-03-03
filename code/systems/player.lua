local player = ecs.system({ pool = {"transform", "player"} })

local PLAYER_SPEED = 160

function player:update(dt)
    for _, e in ipairs(self.pool) do
        if love.keyboard.isDown('left') then
            e.transform.dx = -PLAYER_SPEED
        elseif love.keyboard.isDown('right') then
            e.transform.dx = PLAYER_SPEED
        else
            e.transform.dx = 0
        end

        if love.keyboard.isDown('space') and e.transform.on_ground then
            e.transform.dy = -250
        end

        camera.x = e.transform.x
    end
end

return player
