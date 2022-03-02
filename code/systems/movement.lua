local movement = ecs.system({ pool = {"transform"} })

local GRAVITY = 300

function movement:update(dt)
    for _, e in ipairs(self.pool) do
        e.transform.dy = e.transform.dy + GRAVITY * dt

        local target_x = e.transform.x + e.transform.dx * dt
        local target_y = e.transform.y + e.transform.dy * dt

        local x, y, cols, cols_len = physics_world:move(e.transform, target_x, target_y)
        e.transform.x, e.transform.y = x, y

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

return movement
