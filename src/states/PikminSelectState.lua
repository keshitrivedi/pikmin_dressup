PikminSelectState = Class{__includes = BaseState}

function PikminSelectState:init()
    self.pikmin = Pikmin()
    self.pikmin:init()
end

function PikminSelectState:update(dt)
    self.pikmin:update(dt)
end

function PikminSelectState:render()
    self.pikmin:render()
end