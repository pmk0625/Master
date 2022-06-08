# Snake Game

Snake Game created by Minkyu R. Park

Credit to Michael Shafae(professor) for sharing his outline.
Also, the youtube tutorial videos on youtube.

## Objective

Using keyboard arrow(up, down, left, right), control the snake.
If the snake comes in contact with the food, it will grow in length.

Try to get as long as possible without touching the walls nor itself.

Score on top left will increment as the snake grows.

## Our snake game shall have the following rules or requirements:

* The game must be written in Python using Pygame.

* The game must be graphical (not a text-based or text console game).

* The game must have at least one player (multi-player is at your discretion).

* The game may be controlled from the keyboard, mouse, or joystick.

* If using a joystick, there must be an option to fallback to a keyboard.

* The objective of the game is to score the highest score possible. Scores are increased by the amount of time the game has been played and by having the player's character eat food.

* The player's character dies when the player's character touches itself, another player, a boundary, or a hazard. When the player's character dies, the game ends.

* A game board may have tunnels or passageways which allow a player's character to enter one location in the game world and appear elsewhere in the game world. Tunnels and passageways are optional. Bonuses or penalties may be assigned for using passageways and tunnels.

* A boundary is defined as the limits of the game board and may not be touched or crossed by a player. Food may not appear on a boundary.

* Food appears on the game board at regular intervals. Eating the food elongates the player's character. There must be a minimum of one food type. There may be other food types which increase the player character's size, shape, color, etc. Eating food scores points.

* The player may move their character in four orthogonal directions (up, down, left, right). The player's character behaves like a train which follows the same path until it reaches a point on the game board where a direction was changed. (See https://playsnake.org/ for a visual example of how the snake moves.)

* The player has only one life. Should the player's game end, the player must start over.

* The player accrues points for every 3 seconds of game play. You may determine the number of points and if there are bonus points should a player reach in-game milestones.

* The game presents a start up screen which summarizes the rules and controls. From the start up screen a player may start a new game. Other optional game play options may be presented on the start up screen such as the high score leaderboard, settings, etc.

* The player's points are displayed somewhere on the screen and the display must not interfere with game play.

* The date, the total time played, and the score is saved to a JSON or Pickle file at the end of every game.

* A leaderboard of high scores is presented at the end of every game.

* The option to play again is given at the end of every game.

* A soundtrack and sound effects are optional. You are encouraged to incorporate music and effects into your game.

* The main function must be called from the file named `snake.py`.

* You must conform to [PEP-8](https://www.python.org/dev/peps/pep-0008/). Use [pylint](https://www.pylint.org/) and [pycodestyle](https://pypi.org/project/pycodestyle/) to conform to [PEP-8](https://www.python.org/dev/peps/pep-0008/).

# Rubric

* Functionality (6 points): Your submission shall be assessed for the appropriate constructs and strategies to address the exercise. A program the passes the instructor's tests completely receives full marks. A program that partially passes the instructors tests receives partial-marks. A program that fails the majority or all the tests receives no marks.

* Format & Readability (4 point): Your submission shall be assessed by checking whether your code passess the style and format check, as well as how well it follows the proper naming conventions, and internal documentation guidelines. Git log messages are an integral part of how readable your project is. Failure to include a header forfeits all marks.
* 

## Previews
