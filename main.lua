function love.load()
    anim8 = require 'libraries.anim8'

    player = {}
    player.x = 0
    player.y = 0
    player.speed = 2
    player.sprite = love.graphics.newImage('sprites/player-sheet.png')
    -- grid for animation on player spritesheet image (anim8)
    player.grid = anim8.newGrid(12, 18, player.sprite:getWidth(), player.sprite:getHeight())

    player.animation = {}
    player.animation.down = anim8.newAnimation(player.grid('1-4', 1), 0.2)
    player.animation.up = anim8.newAnimation(player.grid('1-4', 4), 0.2)
    player.animation.left = anim8.newAnimation(player.grid('1-4', 2), 0.2)
    player.animation.right = anim8.newAnimation(player.grid('1-4', 3), 0.2)
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
