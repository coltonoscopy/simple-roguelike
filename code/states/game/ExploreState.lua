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
end

function ExploreState:update(dt)

end

function ExploreState:render()
    self.map:render()
end
