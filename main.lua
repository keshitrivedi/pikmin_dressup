require 'src/Dependencies'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    love.window.setTitle('Pikmin')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    gTextures = {
        ['main'] = love.graphics.newImage('graphics/pikminsprites2.png')
    }

    gFrames = {
        ['pikmin'] = GenerateBasicPikmin(gTextures['main'])
    }

    for i, quad in ipairs(gFrames['pikmin']) do
        print("Quad " .. i .. ":", quad)
    end       

    gStateMachine = StateMachine {
        ['pikminselect'] = function() return PikminSelectState() end
    }
    gStateMachine:change('pikminselect')

    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    love.graphics.clear(173/255, 216/255, 230/255, 1)
    push:apply('start')

    gStateMachine:render()

    push:apply('end')
end