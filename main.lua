function love.load()
    player = {}
    player.x = 0
    player.y = 0
end

function love.update(dt)
    if love.keyboard.isDown("w") then
        player.y = player.y - 2
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - 2
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + 2
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + 2
    end
end

function love.draw()
    love.graphics.circle("fill", player.x, player.y, 40)
end
