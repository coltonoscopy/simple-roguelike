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

require 'code/entity/Entity'

require 'code/states/BaseState'
require 'code/states/game/ExploreState'

require 'code/world/Map'

gTextures = {
    ['tiles'] = love.graphics.newImage('graphics/tiles.png'),
}

gFrames = {
    ['creatures'] = GenerateQuads(gTextures['tiles'], 32, 32)
}
gFrames['tiles'] = gFrames['creatures']
