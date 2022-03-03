local kill = ecs.system({ pool = {"transform"} })

function kill:update(dt)
    for _, e in ipairs(self.pool) do
        if not e.transform.alive then
            e.transform.y = e.transform.y + e.transform.dy * dt
            if e.transform.y > 400 then
                e:destroy()
            end
        end
    end
end

return kill
