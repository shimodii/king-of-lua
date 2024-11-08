function love.load()
    -- player animation library
    anim8 = require 'libraries/anim8'
    -- for fixing low quality of images
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- map library
    sti = require 'libraries/sti'
    gameMap = sti('maps/demoMap.lua')

    player = {}
    player.x = 0
    player.y = 0
    player.speed = 0.3
    player.sprite = love.graphics.newImage('sprites/player-sheet.png')
    player.zoom = 2
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
    -- keep tracking that player is moving or not for better player animation
    -- this help that when player stops moving the sprite that is showing-
    -- to player is the still style that is on column 2 of our spritesheet
    local isMoving = false

    if love.keyboard.isDown("w") then
        player.y = player.y - player.speed
        player.animation = player.animations.up
        isMoving = true
    end
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed
        player.animation = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed
        player.animation = player.animations.down
        isMoving = true
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed
        player.animation = player.animations.right
        isMoving = true
    end

    if isMoving == false then
        player.animation:gotoFrame(2)
    end

    player.animation:update(dt)
    gameMap:update(dt)
end

function love.draw()
    gameMap:draw()
    player.animation:draw(player.sprite, player.x, player.y, nil, player.zoom)
end
