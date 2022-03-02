ecs.component("transform", function(component, x, y, width, height)
    component.x = x or 0
    component.y = y or 0
    component.width = width or CELL_SIZE
    component.height = height or CELL_SIZE
    component.dx = 0
    component.dy = 0
    component.on_ground = false
    physics_world:add(component, component.x, component.y, component.width, component.height)
end)