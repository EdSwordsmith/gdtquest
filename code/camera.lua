camera = {}

function camera:init()
    self.x, self.target_x = 128, 128
    self.y = 128
    self.w = 256
    self.h = 256
    self.speed = 2
end

function camera:update(dt, player_x)
    if player_x > self.target_x + self.w / 2 then
        self.target_x = self.target_x + self.w
    elseif player_x < self.target_x - self.w / 2 then
        self.target_x = self.target_x - self.w
    end

    if self.target_x ~= self.x then
        self.x = self.x + (self.target_x - self.x) * dt * self.speed
    end
end

function camera:apply()
    local x = self.x - self.w / 2
    local y = self.y - self.h / 2
    love.graphics.push()
    love.graphics.translate(-x, -y)
end
