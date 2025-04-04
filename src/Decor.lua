Decor = Class{}

function Decor:init()
    self.width = 63
    self.height = 96

    self.x = VIRTUAL_WIDTH/2 - self.width/2
    self.y = VIRTUAL_HEIGHT/2 - self.height/2

    self.skin = 1
end

function Decor:update()
    if love.keyboard.wasPressed('left') then
        self.skin = (self.skin - 2) % 7 + 1
    end

    if love.keyboard.wasPressed('right') then
        self.skin = (self.skin % 7) + 1
    end
end

function Decor:render()
    love.graphics.draw(gTextures['decorsheet'], gFrames['decor'][self.skin], self.x, self.y)
end