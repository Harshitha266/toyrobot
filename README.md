TOY ROBOT:
    This is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units. There are no other obstructions on the table surface. The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

GETTING STARTED:
  To run the Toy Robot application, you will need Elixir installed on your computer. If you don't have Elixir installed, you can download it from the official website: https://elixir-lang.org/install.html.

  To start the application, open a terminal window and navigate to the project directory. Then run the following command:

  $ iex -S mix
  This will start the Toy Robot application in interactive mode, where you can enter commands to control the robot.

USAGE: 
  The Toy Robot application recognizes the following commands:

  PLACE X,Y,F
    This command will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. The origin (0,0) can be considered to be the SOUTH WEST most corner. The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.

  Example:
  1)
    PLACE 0,0,NORTH
    MOVE
    This command will move the toy robot one unit forward in the direction it is currently facing.

  2)
    MOVE
    LEFT
    This command will rotate the robot 90 degrees to the left without changing the position of the robot.

  3)
    LEFT
    RIGHT
    This command will rotate the robot 90 degrees to the right without changing the position of the robot.

  4)
    RIGHT
    REPORT
    This command will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

TESTING:
  To run the unit tests for the Toy Robot application, open a terminal window and navigate to the project directory. Then run the following command:

    $ mix test
This will run all of the unit tests for the application and print the results to the console.

By adding `toy_robot` to your list of dependencies in `mix.exs`:

```
def deps do
  [
    {:toy_robot, "~> 0.1.0"}
  ]
end
```
