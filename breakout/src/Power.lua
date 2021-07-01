Power = Class{}

function Power:init(type)
    self.width = 16
    self.height = 16
    self.y = VIRTUAL_HEIGHT/2
    self.x = math.random(0,VIRTUAL_WIDTH-16)
    self.dy = 40
    self.type = type
    self.exist = true
end

function Power:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 
    return true
end

function Power:update(dt)
    self.y = self.y + self.dy * dt
    if self.y > VIRTUAL_HEIGHT then
        self.exist = false
    end
end

function Power:render()
    love.graphics.draw(gTextures['main'], gFrames['powerup'][self.type],
        self.x, self.y)
end
