local map = {}

function map:load()
    self.layers = {}

    ldtk:load('assets/world.ldtk')

    function ldtk.entity(entity)
        local e = ecs.entity(ecs_world)
            :give('transform', entity.x, entity.y, entity.width, entity.height)

        if entity.identifier == 'Player' then
            e:give('player')
        end
    end

    function ldtk.layer(layer)
        if layer.identifier == "Tiles" then
            for _, tile in ipairs(layer.tiles) do
                local x, y = layer.x + tile.px[1], layer.y + tile.px[2]
                physics_world:add(tile, x, y, 18, 18)
            end
        end

        table.insert(self.layers, layer)
    end

    function ldtk.onLevelLoad(level)
        self.layers = {}
        love.graphics.setBackgroundColor(level.bgColor)
    end

    ldtk:goTo(1)
end

function map:draw()
    for _, layer in ipairs(self.layers) do
        layer:draw()
    end
end

return map