local ldtk = require 'libs.ldtk'

local layers = {}

function love.load()
    --resizing the screen to 512px width and 512px height
    love.window.setMode(512, 512)

    --setting up the project for pixelart
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setLineStyle('rough')

    ldtk:load('assets/world.ldtk')

    function ldtk.layer(layer) 
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
end