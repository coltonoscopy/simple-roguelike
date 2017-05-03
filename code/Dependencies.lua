require 'code/libs/require'

lume = require 'code/libs/lume'
push = require 'code/libs/push'

Chain = require 'code/libs/knife.chain'
Class = require 'code/libs/hump.class'
Grid = require 'code/libs/jumper.grid'
Pathfinder = require 'code/libs/jumper.pathfinder'
Timer = require 'code/libs/knife.timer'

require 'code/StateMachine'
require 'code/Util'

require 'code/world/Map'

gTextures = {
    ['tiles'] = love.graphics.newImage('graphics/tiles.png'),
    ['creatures'] = love.graphics.newImage('graphics/creatures.png'),
    ['fx24'] = love.graphics.newImage('graphics/fx24.png'),
    ['fx32'] = love.graphics.newImage('graphics/fx32.png')
}

gFrames = {
    ['creatures'] = GenerateQuads(gTextures['creatures'], 24, 24),
    ['tiles'] = GenerateQuads(gTextures['tiles'], 24, 24),
    ['fx24'] = GenerateQuads(gTextures['fx24'], 24, 24),
    ['fx32'] = GenerateQuads(gTextures['fx32'], 32, 32)
}
