local movement = ecs.system({ pool = {"transform"} })

local GRAVITY = 400

function movement:update(dt)
    for _, e in ipairs(self.pool) do
        e.transform.dy = e.transform.dy + GRAVITY * dt

        if e.transform.alive then
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

                if e.transform.tag == 'player' and cols[i].other.tag == 'enemy' then
                    if cols[i].normal.y == -1 then
                        cols[i].other.alive = false
                        physics_world:remove(cols[i].other)
                    else
                        map:die()
                    end
                elseif e.transform.tag == 'enemy' and cols[i].other.tag == 'player' then
                    if cols[i].normal.y == 1 then
                        e.transform.alive = false
                        physics_world:remove(e.transform)
                    else
                        map:die()
                    end
                elseif e.transform.tag == 'player' and cols[i].other.tag == 'win' then
                    map:win()
                end
            end
        end
    end
end

return movement
