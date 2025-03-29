Flower = Class{}

function Flower:init()
    self.width = 42
    self.height = 42

    self.x = VIRTUAL_WIDTH/2 - self.width/2
    self.y = VIRTUAL_HEIGHT/2 - self.height/2 - 69

    self.skin = 1
end
 
function Flower:update(dt)
    if love.keyboard.wasPressed('left') then
        self.skin = (self.skin - 2) % 7 + 1
    end

    if love.keyboard.wasPressed('right') then
        self.skin = (self.skin % 7) + 1
    end
end

function Flower:render()
    love.graphics.draw(gTextures['bigflowers'], gFrames['flower'][self.skin], self.x, self.y)
end