require 'code.libs'

local gamescene = require 'code.scenes.game'

CELL_SIZE = 18

local systems = {}
ecs.utils.loadNamespace('code/components')
ecs.utils.loadNamespace('code/systems', systems)

scene_manager = roomy.new()
physics_world = bump.newWorld(CELL_SIZE)
ecs_world = ecs.world()

ecs_world:addSystems(systems.debug_shapes, systems.movement, systems.player)

animations = {}

function love.load()
    love.window.setMode(768, 768, { resizable = true })
    love.graphics.setDefaultFilter('nearest', 'nearest')
    push.setupScreen(256, 256, { upscale = 'normal' })

    animations.image = love.graphics.newImage('assets/Tilemap/characters_packed.png')
    animations.grid = anim8.newGrid(24, 24, animations.image:getWidth(), animations.image:getHeight())
    animations.player = anim8.newAnimation(animations.grid('1-2', 1), 0.2)

    scene_manager:hook()
    scene_manager:enter(gamescene)
end

function love.resize(width, height)
	push.resize(width, height)
end
