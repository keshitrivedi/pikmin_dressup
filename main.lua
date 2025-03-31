require 'src/Dependencies'

local background_scroll = 0

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
        ['sky'] = love.graphics.newImage('graphics/skybck8.png'),
        ['main'] = love.graphics.newImage('graphics/pikminsprites2.png'),
        ['bigflowers'] = love.graphics.newImage('graphics/flowers.png')
    }

    gFrames = {
        ['pikmin'] = GenerateBasicPikmin(gTextures['main']),
        ['flower'] = GenerateFlowers(gTextures['bigflowers'])
    }

    for i, quad in ipairs(gFrames['pikmin']) do
        print("Quad " .. i .. ":", quad)
    end       

    gStateMachine = StateMachine {
        ['display'] = function() return FinalDisplayState() end
    }
    gStateMachine:change('display')

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
    background_scroll = (background_scroll + BACKGROUND_SCROLL_SPEED*dt) % BACKROUND_LOOPING_POINT
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    love.graphics.clear(173/255, 216/255, 230/255, 1)
    push:apply('start')

    love.graphics.draw(gTextures['sky'], -background_scroll, 0)
    gStateMachine:render()

    push:apply('end')
end