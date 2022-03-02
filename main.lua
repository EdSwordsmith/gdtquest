local ldtk = require 'libs.ldtk'
local bump = require 'libs.bump'
local bump_debug = require 'libs.bump_debug'

local layers = {}
local world = bump.newWorld(18)

function love.load()
    --resizing the screen to 512px width and 512px height
    love.window.setMode(512, 512)

    --setting up the project for pixelart
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setLineStyle('rough')

    ldtk:load('assets/world.ldtk')

    function ldtk.layer(layer)
        if layer.identifier == "Tiles" then
            for _, tile in ipairs(layer.tiles) do
                local x, y = tile.px[1], tile.px[2]
                world:add(tile, x, y, 18, 18)
            end
        end
        table.insert(layers, layer) --adding layer to the table we use to draw 
    end

    function ldtk.onLevelLoad(level)
        layers = {}
        love.graphics.setBackgroundColor(level.bgColor)
    end

    ldtk:goTo(1)
end

function love.draw()
    love.graphics.scale(2, 2)

    for _, layer in ipairs(layers) do
        layer:draw()
    end

    --bump_debug.draw(world)
end