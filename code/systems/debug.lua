local debug = ecs.system({ pool = {"transform"} })

function debug:update(dt)
    require('libs.lovebird').update()
end

function debug:draw(dt)
    for _, e in ipairs(self.pool) do
        local x = e.transform.x - e.transform.width / 2
        local y = e.transform.y - e.transform.height / 2
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle('line', x, y, e.transform.width, e.transform.height)
        love.graphics.setColor(1, 0, 0, 0.5)
        love.graphics.rectangle('fill', x, y, e.transform.width, e.transform.height)
        love.graphics.setColor(1, 1, 1, 1)
    end
end

return debug
