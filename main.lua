require 'code.libs'

require 'code.animations'
local gamescene = require 'code.scenes.game'

CELL_SIZE = 18

local systems = {}
ecs.utils.loadNamespace('code/components')
ecs.utils.loadNamespace('code/systems', systems)

scene_manager = roomy.new()
ecs_world = ecs.world()

ecs_world:addSystems(systems.render, systems.movement, systems.player)

function love.load()
    love.window.setMode(768, 768, { resizable = true })
    love.graphics.setDefaultFilter('nearest', 'nearest')
    push.setupScreen(256, 256, { upscale = 'normal' })

    animations:load()

    scene_manager:hook()
    scene_manager:enter(gamescene)
end

function love.resize(width, height)
	push.resize(width, height)
end
