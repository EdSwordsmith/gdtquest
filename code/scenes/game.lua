local map = require 'code.map'

local gamescene = {}

function gamescene:enter(previous, ...)
    map:load()
end

function gamescene:update(dt)
    ecs_world:emit("update", dt)
end

function gamescene:leave(next, ...)
end

function gamescene:draw()
    push.start()
    map:draw()
    ecs_world:emit("draw")
    push.finish()
end

return gamescene