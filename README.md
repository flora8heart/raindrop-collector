# Raindrop Collector

[![Lua](https://img.shields.io/badge/-Lua-2C2D72?logo=lua&logoColor=ffffff)]()
[![Love2D](https://img.shields.io/badge/-Love2D-EF223A?logo=heart&logoColor=ffffff)]()

Raindrop collector is a game written in Lua using the Love2D framework. In this game user will be controlling the basket by moving it across the screen left and right to collect the raindrops.

## Table of Content

- [How to run the game](#how-to-run-the-game)
- [Usage](#usage)
- [Game Logic](#game-logic)
- [Source Files](#source-files)
- [Acknowledgement](#acknowledgements)

## Dependencies

Download LÖVE from [here](https://love2d.org/)

## How to run the game

1. If LÖVE is not installed, download LÖVE from [here](https://love2d.org/)
2. Two ways to run the game:

- Download or clone this repo and drag the folder to the LÖVE application shortcut
- Or download the **RaindropCollector.love** file from the latest release [here](https://github.com/flora8heart/raindrop-collector/releases/tag/v.1.0.0). Double click on the `.love` file to run it.

## Controls and Gameplay

1. On the intro screen, press `Return` or `Space` to start the game.
2. Use the `left`/`a` and `right`/`d` keys to collect the raindrops
3. After more than _5 raindrops_ is missed, the game ends.
4. Press `Return` or `Space` to restart the game; or `Q` or `esc` key to exit to intro screen.

## Demo

**Intro Screen**
<br>
<img src="img/intro-screen.png" align="center" width="500">
<br>

**Playing Screen**
<br>
<img src="img/playing-screen.png" align="center" width="500">
<br>

**Game Over Screen**
<br>
<img src="img/gameover-screen.png" align="center" width="500">
<br>

## Game Mechanics

- The game increases in difficulty as more raindrops are collected. The game ends when 6 raindrops has been missed.
- The cloud movement speed increases after every 10 raindrops has been collected.
- The basket movement speed increases as the game increases in difficulty as cloud movement speed increases.

<!-- ## Source Files -->

## Future Work

- Add varied facial reactions to the basket.
- Add leadership board

<!-- ## Acknowledgements -->
