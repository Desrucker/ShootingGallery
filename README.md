# Shooting Gallery Game

A simple yet engaging shooting gallery game developed using the LÖVE framework for Lua.

## Features

- **Dynamic Targets**: Targets appear in random locations on the screen.
- **Scoring System**: Earn points by accurately clicking on the targets.
- **Time Limit**: Quick gameplay with a timer to challenge players.
- **Custom Graphics**: Includes custom sprites for sky, target, and crosshairs.

## Code Structure

### Global Variables

- `target`, `score`, `timer`, `gameState`: Game state variables.
- `gameFont`, `sprites`: Font and sprite variables.

### Functions

#### `love.load()`
Initializes game variables, loads sprites, and sets up the game environment.

#### `love.update(dt)`
Updates the game state, decreases timer, and resets game when the timer runs out.

#### `love.draw()`
Handles all the drawing on the screen, including sprites and game text.

#### `targetGenerator()`
Generates a new target at a random location.

#### `love.mousepressed(x, y, button)`
Handles mouse click events for starting the game and shooting targets.

#### `distanceBetween(x1, y1, x2, y2)`
Calculates the distance between two points, used to determine if a target is hit.

## Gameplay

- Click to start the game. 
- Aim and click on the targets to score points.
- The game ends when the timer runs out.
- Score as much as you can before the time ends!
