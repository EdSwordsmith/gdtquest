ecs.component("transform", function(component, x, y, width, height, tag)
    component.tag = tag or 'enemy'
    component.alive = true
    component.x = x
    component.y = y
    component.width = width
    component.height = height
    component.dx = 0
    component.dy = 0
    component.on_ground = false
    physics_world:add(component, component.x - component.width / 2, component.y - component.height / 2, component.width, component.height)
end)