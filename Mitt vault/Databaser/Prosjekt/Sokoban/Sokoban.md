---
Ressursar:
  - "[[Sokoban-oppgåver]]"
  - "[[Sokoban-informasjon]]"
  - "[[Godot-ressursar]]"
Prosjektstatus: I arbeid
Prosjekttype: Privat
---
  

## ToDo

- [ ] Refactor level code
    - [ ] Level = the visual/view that the player moves in and interacts with
        - [ ] Has TileMap, Player, Camera, Parser, PuzzleState
    - [ ]
    - [ ] PuzzleState = keeps track of puzzle state
        - [ ] Start state
        - [ ] Keeps track of and can be queried for elements and victory condition
        - [ ] Calculates and converts between coordinates
        - [ ] Can check if a player or crate can move in a certain direction
- [ ] Don't accept new movement if a movement is already being animated
    - [ ] Alternatively, place them in a queue, if that makes for better UX

LevelParser = reads the file

- [ ] Gets file
- [ ] Reads, parses and validates the file
- [ ] Returns Puzzle node if successful

  

- [ ] Click mouse to move along A* path
    - [x] Undo = undoes the whole path
    - [ ] Move stepwise along path, don't jump directly (also for undo/redo)
- [ ] Key delay/repeat also for undo/redo
- [ ] Remove collision detection, use level grid instead.
- [ ] Show number of goals filled and total number of goals (for example, 4/10)
- [ ] Show number of moves and pushes taken
- [ ] Save progress
    - [ ] Save best win, even if one rewinds and tries again from some point
- [ ] Start screen / select puzzle

## Someday/Maybe

- [ ] Playback controls
    - [ ] Play, Rewind, Stop
    - [ ] Slider to choose position
        - [ ] Step buttons on each end
        - [ ] Show step number (start, end, current)
    - [ ] Do something from that position = delete actions after that
- [ ] Indicate locked state of crates and the game in general
    - [ ] Locked to wall: ↕️ ↔️ 
    - [ ] Unmovable: ⏹️
    - [ ] Also show some message about the game not being solvable anymore
- [ ]

  

  

  

  

[[NiceSokoban Game Design Document]]

[[Input player movement]]

## Features

- [ ] Automatic pathfinding (click on where you want to go)
    
    [[A pathfinding]]
    
- [ ] Undo/redo
    - [x] UndoRedo implemented
    - [ ] Record moves as string to be saved along with game
        - [ ] Add to string on do, remove from string on undo
    - [ ] Show total number of moves
- [ ] Reset puzzle
- [ ] Save and load games
    
    - [ ]
    
    [[Save and load games]]
    
- [ ] Import/export
    - [ ] Level author credits
    - [ ] Author link
- [ ] Level editor

  

> [!info] Tactical RPG Movement series  
> Learn to move units on a grid-based game board, avoiding obstacles, finding a path to their target, and much more in this free Godot tutorial series.  
> [https://www.gdquest.com/tutorial/godot/2d/tactical-rpg-movement/](https://www.gdquest.com/tutorial/godot/2d/tactical-rpg-movement/)  

## Tilemap

### Autotile

> [!info] TileMap: using autotile :: Godot 3 Recipes  
> You are using a TileMap, and want to use autotiling to more quickly draw your levels.  
> [https://kidscancode.org/godot_recipes/3.x/2d/autotile_intro/index.html](https://kidscancode.org/godot_recipes/3.x/2d/autotile_intro/index.html)  

![[Untitled.png]]

  

[https://www.youtube.com/watch?v=G6TC6ukmSc4](https://www.youtube.com/watch?v=G6TC6ukmSc4)

## Pathfinding

> [!info] AStarGrid2D  
> Inherits: RefCounted< Object An implementation of A* for finding the shortest path between two points on a partial 2D grid.  
> [https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html)  

## Game stats and score

[https://www.youtube.com/watch?v=lkr5-VjGHxs](https://www.youtube.com/watch?v=lkr5-VjGHxs)

## Saving and loading games with Godot

[https://www.youtube.com/watch?v=43BZsLZheA4](https://www.youtube.com/watch?v=43BZsLZheA4)

## File format

> [!info] Level format  
> The most commonly used format for representing a level of Sokoban is: The simplest solvable level looks like this: ##### #@$.  
> [http://www.sokobano.de/wiki/index.php?title=Level_format](http://www.sokobano.de/wiki/index.php?title=Level_format)