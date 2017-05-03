love.keyboard.keysPressed = {}
love.keyboard.keysReleased = {}
love.mouse.buttonsPressed = {}
love.mouse.buttonsReleased = {}

require 'code/Dependencies'

virtualWidth = 384
virtualHeight = 216

-- state machine controlling our various game states
gGameSM = StateMachine {
    ['explore'] = function() return ExploreState() end,
    -- ['mainmenu'] = function() return MainMenuState() end,
    -- ['menu'] = function() return MenuState() end
}
gGameSM:change('explore')

function love.load()
    love.graphics.setFont(love.graphics.newFont('fonts/font.ttf', 8))
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Battle Engine')

    push:setupScreen(virtualWidth, virtualHeight, 1280, 720, {
        fullscreen = false,
        resizable = true
    })
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)
    gGameSM:update(dt)

    love.keyboard.keysPressed = {}
    love.keyboard.keysReleased = {}
    love.mouse.buttonsPressed = {}
    love.mouse.buttonsReleased = {}
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.keyboard.wasReleased(key)
    if love.keyboard.keysReleased[key] then
        return true
    else
        return false
    end
end

function love.mouse.wasPressed(key)
    if love.mouse.buttonsPressed[key] then
        return true
    else
        return false
    end
end

function love.mouse.wasReleased(key)
    if love.mouse.buttonsReleased[key] then
        return true
    else
        return false
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end

function love.keyreleased(key)
    love.keyboard.keysReleased[key] = true
end

function love.mousepressed(x, y, button)
    love.mouse.buttonsPressed[button] = true
end

function love.mousereleased(x, y, button)
    love.mouse.buttonsReleased[button] = true
end

function love.draw()
    push:apply('start')

    gGameSM:render()

    push:apply('end')
end
