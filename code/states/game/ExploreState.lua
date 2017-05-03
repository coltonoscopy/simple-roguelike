--[[
    State for when we are walking about in the game world ("exploring").
]]

ExploreState = Class{__includes = BaseState}

function ExploreState:init()
    self.map = Map {
        texture = gTextures['tiles'],
        frames = gFrames['tiles'],
        tileHeight = 24,
        tileWidth = 24,
        mapWidth = 100,
        mapHeight = 100
    }

    self.player = Entity {
        x = 0,
        y = 0,
        texture = gTextures['creatures'],
        frame = 1,
    }
end

function ExploreState:update(dt)
    self.player:update(dt)
end

function ExploreState:render()
    self.map:render()
    self.player:render()
end
