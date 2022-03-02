local movement = ecs.system({ pool = {"transform"} })

local GRAVITY = 300

function movement:update(dt)
    for _, e in ipairs(self.pool) do
        e.transform.dy = e.transform.dy + GRAVITY * dt

        local target_x = e.transform.x - e.transform.width / 2 + e.transform.dx * dt
        local target_y = e.transform.y - e.transform.height / 2 + e.transform.dy * dt

        local x, y, cols, cols_len = physics_world:move(e.transform, target_x, target_y)
        e.transform.x, e.transform.y = x + e.transform.width / 2, y + e.transform.height / 2

        e.transform.on_ground = false
        for i = 1, cols_len do
            if cols[i].normal.y ~= 0 then
                e.transform.dy = 0
            end

            if cols[i].normal.y == -1 then
                e.transform.on_ground = true
            end
        end
    end
end

--[[
function movement:draw(dt)
    for _, e in ipairs(self.pool) do
        local x = e.transform.x - e.transform.width / 2
        local y = e.transform.y - e.transform.height / 2
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle('line', x, y, e.transform.width, e.transform.height)
    end
end

return movement
