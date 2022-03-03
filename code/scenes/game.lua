gamescene = {}

function gamescene:enter(previous, ...)
    ldtk:goTo(1)
    camera:init()
end

function gamescene:update(dt)
    ecs_world:emit("update", dt)
end

function gamescene:leave(next, ...)
end

function gamescene:draw()
    push.start()
    camera:apply()
    map:draw()
    ecs_world:emit("draw")
    love.graphics.pop()
    push.finish()
end
