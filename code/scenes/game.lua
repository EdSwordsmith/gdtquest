gamescene = {}

function gamescene:enter(previous, ...)
    map:reset()
    camera:init()
end

function gamescene:update(dt)
    ecs_world:emit("update", dt)
end

function gamescene:leave(next, ...)
end

function gamescene:draw()
    love.graphics.setFont(small_font)
    love.graphics.print("Death Counter: " .. map.deaths, 0, 0)

    push.start()
    camera:apply()
    map:draw()
    ecs_world:emit("draw")
    love.graphics.pop()
    push.finish()
end
