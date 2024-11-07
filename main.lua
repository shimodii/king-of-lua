function love.load()
    player = {}
    player.x = 0
    player.y = 0
end

function love.update(dt)
    
end

function love.draw()
    love.graphics.circle("fill", player.x, player.y, 40)
end
