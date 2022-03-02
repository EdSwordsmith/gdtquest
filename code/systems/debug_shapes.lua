local debug_shapes = ecs.system({ pool = {"transform"} })

function debug_shapes:draw()
    for _, e in ipairs(self.pool) do
        love.graphics.setColor(1, 0, 0, 0.4)
        love.graphics.rectangle("fill", e.transform.x, e.transform.y, e.transform.width, e.transform.height)
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.rectangle("line", e.transform.x, e.transform.y, e.transform.width, e.transform.height)
    end
end

return debug_shapes
