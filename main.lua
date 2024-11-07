function love.load()
    anim8 = require 'libraries.anim8'
    -- for fixing low quality of images
    love.graphics.setDefaultFilter("nearest", "nearest")

    player = {}
    player.x = 0
    player.y = 0
    player.speed = 2
    player.sprite = love.graphics.newImage('sprites/player-sheet.png')
    -- grid for animation on player spritesheet image (anim8)
    player.grid = anim8.newGrid(12, 18, player.sprite:getWidth(), player.sprite:getHeight())

    -- player animations table with grids
    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.2)
    player.animations.up = anim8.newAnimation(player.grid('1-4', 4), 0.2)
    player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.2)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 3), 0.2)

    -- default animation direction for tracking animation direction
    player.animation = player.animations.right
end

function love.update(dt)
    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed
        player.animation = player.animations.up
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed
        player.animation = player.animations.left
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed
        player.animation = player.animations.down
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed
        player.animation = player.animations.right
    end

    player.animation:update(dt)
end

function love.draw()
    player.animation:draw(player.sprite, player.x, player.y, nil, 10)
end
