-- GAME - Shooting Gallery

local target, score, timer, gameState
local gameFont, sprites

function love.load()
    target = {x = 300, y = 300, radius = 50}
    score = 0
    timer = 0
    gameState = 1

    gameFont = love.graphics.newFont(25)

    sprites = {
        sky = love.graphics.newImage('sprites/sky.png'),
        target = love.graphics.newImage('sprites/target.png'),
        crosshairs = love.graphics.newImage('sprites/crosshairs.png')
    }

    love.mouse.setVisible(false)
end

function love.update(dt)
    if timer > 0 then
        timer = timer - dt
    end
    if timer <= 0 and gameState == 2 then
        gameState = 1
        timer = 0
        score = 0
    end
end

function love.draw()
    love.graphics.draw(sprites.sky, 0, 0)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print("Score: " .. score, 5, 5)
    love.graphics.print("Time: " .. math.ceil(timer), 5, 50)

    if gameState == 1 then
        love.graphics.printf("Click anywhere to begin!", 0, 250, love.graphics.getWidth(), 'center')
    elseif gameState == 2 then
        love.graphics.draw(sprites.target, target.x - target.radius, target.y - target.radius)
    end

    love.graphics.draw(sprites.crosshairs, love.mouse.getX() - 20, love.mouse.getY() - 20)
end

function targetGenerator()
    target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
    target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
end

function love.mousepressed(x, y, button)
    if gameState == 1 and button == 1 then
        gameState = 2
        timer = 10
    elseif gameState == 2 then
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < target.radius then
            if button == 1 then
                score = score + 1
            elseif button == 2 then
                score = score + 2
                timer = timer - 1
            end
            targetGenerator()
        else
            if score > 0 then
                score = score - (button == 1 and 1 or 2)
            end
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end