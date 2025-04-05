FinalDisplayState = Class{_includes = BaseState}

function FinalDisplayState:init()
    self.pikmin = Pikmin()
    self.flower = Flower()
    self.decor = Decor()

    self.pikmin:init()
    self.flower:init()
    self.decor:init()

    self.selectMode = 1
end

function FinalDisplayState:enter(params)
end

function FinalDisplayState:exit()
end

function FinalDisplayState:update(dt)
    local modeKeys = {p=1, f=2, d=3}
    for key, mode in pairs(modeKeys) do
        if love.keyboard.wasPressed(key) then
            sounds['mode']:play()
            self.selectMode = mode
            break
        end
    end

    if self.selectMode == 1 then
        self.pikmin:update(dt)
    elseif self.selectMode == 2 then
        self.flower:update(dt)
    elseif self.selectMode == 3 then
        self.decor:update(dt)
    end
end

function FinalDisplayState:render()
    self.pikmin:render()
    self.flower:render()
    self.decor:render()
end