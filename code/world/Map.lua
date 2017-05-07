--[[
    Class used to represent a tile map in the game.
]]

Map = Class{}

function Map:init(def)
    self.x = 0
    self.y = 0
    self.camX = 0
    self.camY = 0

    self.texture = def.texture
    self.tileFrames = def.frames
    self.tileWidth = def.tileWidth
    self.tileHeight = def.tileHeight
    self.mapHeight = def.mapHeight
    self.mapWidth = def.mapWidth

    self.widthPixel = self.tileWidth * self.mapWidth
    self.heightPixel = self.tileHeight * self.mapHeight

    self.tiles = {}

    self:generate()
end

--[[
    Simple function to generate a map of values that will map to tile frames.
]]
function Map:generate()
    -- populate tile map
    for y = 1, self.mapHeight do
        for x = 1, self.mapWidth do
            self.tiles[(y - 1) * self.mapWidth + x] = {
                id = lume.weightedchoice {
                    [855] = 15, [858] = 3, [914] = 3
                },
                owned = false
            }
        end
    end
end

function Map:getTile(x, y)
    return self.tiles[(y - 1) * self.mapWidth + x]
end

--[[
    Given an X and a Y coordinate, see which tile that falls under and return it.
]]
function Map:pointToTile(x, y)
    x = math.max(self.x, x)
    y = math.max(self.y, y)

    x = math.min(x, self.widthPixel - 1)
    y = math.min(y, self.heightPixel - 1)

    local tileX = math.floor(x / self.tileWidth)
    local tileY = math.floor(y / self.tileHeight)

    return tileX + 1, tileY + 1
end

function Map:render()
    -- top left camera corner
    local tileLeft, tileTop =
        self:pointToTile(self.camX, self.camY)

    -- bottom right camera corner
    local tileRight, tileBottom =
        self:pointToTile(self.camX + virtualWidth - 1, self.camY + virtualHeight - 1)

    -- draw only what's in sight
    for y = tileTop, tileBottom do
        for x = tileLeft, tileRight do
            love.graphics.draw(self.texture, self.tileFrames[self:getTile(x, y).id],
                (x - 1) * self.tileWidth, (y - 1) * self.tileHeight, 0, 1, 1)
        end
    end
end
