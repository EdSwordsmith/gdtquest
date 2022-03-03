require 'code.libs'

require 'code.map'
require 'code.animations'
require 'code.camera'
require 'code.prefabs'
require 'code.scenes.start'
require 'code.scenes.game'

CELL_SIZE = 18

local systems = {}
ecs.utils.loadNamespace('code/components')
ecs.utils.loadNamespace('code/systems', systems)

scene_manager = roomy.new()
ecs_world = ecs.world()

ecs_world:addSystems(
    systems.render,
    systems.movement, 
    systems.player, 
    systems.follow_path,
    systems.debug
)

function love.load()
    love.window.setMode(768, 768, { resizable = true })
    love.graphics.setDefaultFilter('nearest', 'nearest')
    push.setupScreen(384, 256, { upscale = 'pixel-perfect' })

    animations:load()

    big_font = love.graphics.newFont("assets/GammaRay.ttf", 100)
    small_font = love.graphics.newFont("assets/GammaRay.ttf", 45)

    map:load()

    scene_manager:hook()
    scene_manager:enter(startscene)
end

function love.resize(width, height)
	push.resize(width, height)
end
