local follow_path = ecs.system({ pool = {"transform", "path"} })

function sign(number)
    return number > 0 and 1 or (number == 0 and 0 or -1)
end

function follow_path:update(dt)
    for _, e in ipairs(self.pool) do
        local target = e.path.points[e.path.target]
        local dx = target.x - e.transform.x
        local dy = target.y - e.transform.y
        local dist_sqr = dx * dx + dy * dy


        if dist_sqr > 81 then
            local dist = math.sqrt(dist_sqr)
            dx = 100 * dx / dist
            dy = 100 * dy / dist
            e.transform.dx = dx
            e.transform.dy = dy
        else
            e.path.target = e.path.target + 1
            if e.path.target > #e.path.points then
                e.path.target = 1
            end
        end
    end
end

return follow_path
