map = {}

local LEVEL_COUNT = 3

function map:load()
    self.layers = {}
    self.death_line = 400

    ldtk:load('assets/world.ldtk')
    function ldtk.entity(entity)
        if prefabs[entity.identifier] then
            prefabs[entity.identifier](entity)
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
        self.death_line = level.height + 200
        self.layers = {}
        physics_world = bump.newWorld(CELL_SIZE)
        ecs_world:clear()
        love.graphics.setBackgroundColor(level.bgColor)
    end
end

function map:reset()
    self.deaths = 0
    self.current_level = 1
    ldtk:goTo(self.current_level)
end

function map:draw()
    for _, layer in ipairs(self.layers) do
        layer:draw()
    end
end

function map:die()
    self.deaths = self.deaths + 1
    ldtk:goTo(self.current_level)
end

function map:win()
    self.current_level = self.current_level + 1
    if self.current_level <= LEVEL_COUNT then
        ldtk:goTo(self.current_level)
    else
        scene_manager:enter(finishscene)
    end
end
