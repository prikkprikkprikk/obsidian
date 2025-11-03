> [!important]
> 
> [Source](https://docs.google.com/document/d/1Vl7BMvzUOhbunJrI_X1gUc6x-LAp3aaBiPwHUf27B70/edit#heading=h.hsocr1h7bri7)

## Introduction

The purpose of NiceSokoban is to get as much out of the way as possible, so only sokoban solving remains.

### Game Summary

NiceSokoban should present collections of sokoban puzzles for solving with a minimal user interface and design, and make solving them as fluid as possible.

It should keep track of the player’s progress; this also with the goal of minimizing aggravation for the player and providing satisfaction over clearly seeing their progress.

### Inspiration

The one and only inspiration for NiceSokoban is [Sokoban for the Macintosh by Scott Lindhurst](https://www.macintoshrepository.org/5296-sokoban).

The author fondly remembers hours of playing this game over two decades ago. Its design was simple and clear, and got out of the way. It also had unlimited undo, tracked your moves/pushes, and had path finding for fast moving around, for faster solving of the larger and more complicated levels.

![[📎 Filer/Untitled 5.png|Untitled 5.png]]

![[📎 Filer/Untitled 1 3.png|Untitled 1 3.png]]

### Player Experience

NiceSokoban should get as much out of the way as possible, to enable the player to concentrate on the puzzle and solve it fluidly (that is, without any distracting elements or annoying user interface/expirience elements).

### Platform

NiceSokoban will primarily be made for computers/keyboards, although it might also be adapted for touchscreens if a nice enough way of receiving input from the player can be found.

### Development Software

NiceSokoban will be developed in the Godot game engine, as a first project for the author, intended for learning the engine.

### Genre

As sokoban is a puzzle game, NiceSokoban also falls in the “puzzle games” genre.

### Target Audience

NiceSokoban is for anyone interested in puzzle games, as sokoban levels can be made in difficulties suitable for all ages.

## Concept

### Gameplay overview

> [!important]
> 
> [From Wikipedia](https://en.wikipedia.org/wiki/Sokoban):
> 
> Sokoban (倉庫番, Sōko-ban, lit. '**warehouse keeper**')

In sokoban puzzles, the player is a warehouse keeper whose job it is to push crates onto designated locations.

### Primary Mechanics

The player can push (but not pull) crates around on the floor of a warehouse.

The goal is to push every crate onto one of the goal squares. Thus, there should always be an equal amount of crates and goal squares, but it does not matter which crate ends up on which goal square.

### Secondary Mechanics

As a result of the player only being able to push the crates and not pull them, it is possible for crates to become stuck, either partly stuck against a wall or entirely stuck in a corner.

The came could/should maybe report when it reaches such an unsolvable state.

## Design

One of the main reasons NiceSokoban is being made, and is called _Nice_Sokoban, is because almost every Sokoban game in existence looks horrible, like they’re designed by non-designers in Microsoft Paint, with garish and clashing colours and patterns, which makes it hard to see and concentrate on the actual puzzle.

_Sokoban for the Macintosh_ was different, with its simplistic design, although its pseudo-3D look might be viewed as a bit outdated today.

![[📎 Filer/Untitled 2 3.png|Untitled 2 3.png]]

Again, the goal of NiceSokoban is to be as conductive as possible to the process of solving the puzzle. In the authors opinion, this means:

- The colors should be muted and should harmonize with eachother.
- There should be no textures or other kinds of patterns.
- Any kind of 3D look should ideally be avoided, unless research finds that it helps the player solve the puzzle (by more clearly separating the various elements from eachother).
- It should be obvious which elements are static (walls and goals) and which may be moved (player and crates). (In the screenshot below, the player and crate have more saturated colors than the background, walls and goal.
- It should be made clear, somehow, that the goal squares are meant for the crates. (Probably through similarity of shape.) [IDEA: Make a slight outer glow around boxes when they sit on goal squares.]

Below is a screenshot of the initial design exploration. Although it is definitely subject to change, it demonstrates most of the points above:

![[📎 Filer/Untitled 3 3.png|Untitled 3 3.png]]

## Audio

The game should have no audio at all, to minimize distractions and annoyances.

## Game Experience

When all crates are on goal squares, the game should report that the level has been solved, and record it as such. However, it should probably still be possible to undo, so that the player might have a chance to improve the score.

### UI

Minimalistic, with only the minimal amount of text and controls (buttons).

### Controls

**Keyboard**

- Arrow keys control the movement of the player.
- Standard undo/redo keys should work as expected.
- Escape key should exit to the puzzle select menu (with confirmation dialog).
- Quit with standard keyboard shortcut. No saving necessary, game should start where you left off last time.

**Mouse**

- Point mouse on a square to see shortest path, if possible.
- Click mouse to quickly go there (with or without animation, depending on player’s setting)

## Development Timeline

The game will be developed in the author’s spare time, so it will be ready when it’s ready.