prefabs = {}

prefabs.Player = function(entity)
    ecs.entity(ecs_world)
        :give('transform', entity.x, entity.y, entity.width, entity.height, 'player')
        :give('player')
        :give('sprite', animations:player())
end

prefabs.Winged = function(entity)
    local path = {}
    for _, point in ipairs(entity.props.Path) do
        table.insert(path, { x = point.cx * CELL_SIZE, y = point.cy * CELL_SIZE })
    end

    ecs.entity(ecs_world)
        :give('transform', entity.x, entity.y, entity.width, entity.height)
        :give('sprite', animations:winged())
        :give('path', path)
end
