function love.load()
    anim8 = require 'libraries.anim8'

    player = {}
    player.x = 0
    player.y = 0
    player.speed = 2
    player.sprite = love.graphics.newImage('sprites/player-sheet.png')
end

function love.update(dt)
    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed
    end
end

function love.draw()
    love.graphics.circle("fill", player.x, player.y, 40)
end
