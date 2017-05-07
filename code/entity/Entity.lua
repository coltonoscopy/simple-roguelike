--[[
    Represents the basic aspects of a moving, interacting entity in the game
    world.
]]

Entity = Class{}

function Entity:init(def)
    self.texture = def.texture
    self.frame = gFrames['creatures'][def.frame]
    self.x = def.x
    self.y = def.y
end

function Entity:update(dt)
    if love.keyboard.wasPressed('w') then
        self.y = self.y - 1
    end
    if love.keyboard.wasPressed('s') then
        self.y = self.y + 1
    end
    if love.keyboard.wasPressed('a') then
        self.x = self.x - 1
    end
    if love.keyboard.wasPressed('d') then
        self.x = self.x + 1
    end
end

function Entity:render()
    love.graphics.draw(self.texture, self.frame, self.x * 32, self.y * 32 - 8)
end
