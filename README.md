# Raindrop Collector

[![Lua](https://img.shields.io/badge/-Lua-2C2D72?logo=lua&logoColor=ffffff)]()
[![Love2D](https://img.shields.io/badge/-Love2D-EF223A?logo=heart&logoColor=ffffff)]()

Raindrop collector is a game written in Lua using the Love2D framework. In this game, the player will be controlling the basket by moving it across the screen left and right to collect the raindrops.

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

**Scoring**

A score of 1 is awarded for each raindrop collected.

**Game Over Conditions**

The player loses if they miss more than 5 raindrops where the game end when a total of 6 raindrops has been missed either consecutively or cumulatively.

**Difficulty Progression**

The game increases in difficulty as more raindrops are collected.

**Cloud Movement Speed**

The cloud movement speed increases after every 10 raindrops has been collected.

**Basket Movement Speed**

The basket movement speed also increases as the game increases in difficulty to align with the increasing cloud movement speed.

## Source Files

**classic.lua**

A third-party library created by [rxi](https://github.com/rxi/classic), a tiny class module for Lua which allows the creation of objects by facilitating object-oriented programming.

**classicExtra.lua**

An extension to the `classic.lua` module, to be used alongside it. This file an additional functionality which is the increase speed logic function. This separate module was created to ensure that the original `classic.lua` module is not modified.

**main.lua**

This is the main file of the game and is the entry point of the game. This initialises, updates and draw the current game state by handling the game loops and managing the overall flow of the game.

**cloud.lua**

This file contains the code for the cloud object which includes its initialisation conditions, movement logic and its interaction with other game element.

**basket.lua**

This file contains the code for the basket object, including its movement and collision detection with the raindrop object.

**raindrop.lua**

This file contains the code for the raindrop object where it defines the behaviour and the properties of the raindrop object which include how it spawns, its movement and its interactions with the basket object.

## Ideas for future Work

- **Add varied facial reactions to the basket**: Implement different facial expressions on the basket to reflect different game event, providing visual feedback for the players to enhance player engagement. For example, A happy face when a raindrop is collected and a sad face when a raindrop is missed.

- **Add leaderboard feature**: Include a leaderboard feature to store and display the current high scores to increase replayability. This can motivate the player to beat their own high scores or compete against others. This can include options for both local or online leaderboards to keep track of player performance and cultivate competition.

## Credits and Acknowledgements

I would like to thank [sheepolution](https://sheepolution.com/learn) for providing simple and easy-to-understand tutorials on the usage of Love2D engine, which enabled me to create my first game.

The following are the library, image and sound assets used in this game:

**Library**

- `Classic` library created by [rxi](https://github.com/rxi/classic)

**Image assets**

- **Basket**: [Picnic basket Kawaii Lineal color icon | Freepik](https://www.freepik.com/icon/picnic-basket_4646543)
- **Raindrop**: [Water day Kawaii Lineal color icon | Freepik](https://www.freepik.com/icon/water-day_6696386#fromView=search&page=1&position=12&uuid=aff669b9-5e5b-49a3-be68-5da1ab480256)
- **Cloud**: [Cloud Kawaii Lineal color icon | Freepik](https://www.freepik.com/icon/cloud_14036354#fromView=search&page=1&position=70&uuid=f91ecc6e-5eec-4aa7-87fb-fc8df2870af7)

**Sound assets**

- **Raindrop Sound**: [Drop - Water by mattfinarelli](https://freesound.org/people/mattfinarelli/sounds/533146/)
- **Rainfall Sound**: [Rain Sound Effects | Mixkit](https://mixkit.co/free-sound-effects/rain/)
- **Collision Sound**: Generated using a sound effect generator called [bfxr](http://www.bfxr.net/?s=2%2C0.22%2C%2C0.0563%2C0.5729%2C0.208%2C0.3%2C0.4827%2C%2C%2C%2C%2C%2C%2C%2C%2C%2C%2C%2C%2C%2C%2C%2C%2C%2C1%2C%2C%2C%2C%2C%2C%2CmasterVolume)
