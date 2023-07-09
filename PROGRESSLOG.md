# Progress Log
(To keep track of whats been done)

## 6/17/23
* Added images for
  * Idle Animation + Flip
  * Run Animation + Flip
* Implemented left/right movement

## 6/18/23
* Reorganized images into separate folders
* Added images for
  * Jump Animation + Flip
* Implemented Jumping
* Started work on classes used for combat and combat itself
* Added comments so Tammy can hopefully decipher the mess that is my code

## 6/19/23

### General
* Increased screen size
* Manually resized Vishu's sprites so they don't look poopy dog water quality.
* Run animation is no longer called while midair.
* Organized area images and combat images
* Changed controls from WASD to arrow keys

### Combat
* Separated keyboard press inputs for fight mode.
  * Results in cleaner option selects.
* Created prototype screens for attacking, selecting a target, picking a move.
* Created background for battle info.

## 6/21/23

### Fighter
* Added a speed stat which will be used to determine turn order.

### Combat
* Added a button for recharge (currently not functional).
* Added animation for option select.
* Added picture for turn order on top of screen.
* Added an arraylist of fighters to keep track of turn order, fighters are sorted using insertion sort based on speed.

## Didn't keep track of dates for these updates

### Combat
* Added attack animation for Vishu.
* Enemies can attack and die.
* Fixed bug where turn order would get messed up whenever the number of combatants changes (ex when someone dies).

## 7/9/23

### Fighter
* Implemented base stats and formulas to calculate stats.

### Moves
* Started work on making moves, created constructor.

### Other
* Created a spreadsheet to keep track of character data (stats and moves at each level).
