camera = {}

function camera:init()
    self.w = push.getWidth()
    self.h = push.getHeight()

    self.x = self.w / 2
    self.y = self.h / 2
    self.target_x = self.x
    self.target_y = self.y

    self.speed_x = 4
    self.speed_y = 4
end

function camera:update(dt, player_x, player_y)
    --[[
    if player_x > self.target_x + self.w / 2 then
        self.target_x = self.target_x + self.w
    elseif player_x < self.target_x - self.w / 2 then
        self.target_x = self.target_x - self.w
    end
    --]]

    self.target_x = player_x
    if self.target_x ~= self.x then
        self.x = self.x + (self.target_x - self.x) * dt * self.speed_x
    end

    self.target_y = player_y
    if self.target_y ~= self.y then
        self.y = self.y + (self.target_y - self.y) * dt * self.speed_y
    end
end

function camera:apply()
    local x = self.x - self.w / 2
    local y = self.y - self.h / 2
    love.graphics.push()
    love.graphics.translate(-x, -y)
end
