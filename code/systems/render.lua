local render = ecs.system({ pool = { 'transform', 'sprite' } })

function render:update(dt)
    for _, e in ipairs(self.pool) do
        if e.transform.dx < 0 then
            e.sprite.animation.flippedH = false
        elseif e.transform.dx > 0 then
            e.sprite.animation.flippedH = true
        end
        e.sprite.animation:update(dt)
    end
end

function render:draw()
    for _, e in ipairs(self.pool) do
        local x = e.transform.x - animations.offset_x
        local y = e.transform.y - animations.offset_y
        e.sprite.animation:draw(animations.image, x, y)
    end
end

return render
