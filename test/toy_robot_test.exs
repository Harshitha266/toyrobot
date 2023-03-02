defmodule ToyRobotTest do
  use ExUnit.Case
  alias ToyRobot.ToyRobot

# PLACE 0,0,NORTH
# MOVE
# REPORT

  test "run the robot" do
    assert ToyRobot.run(["PLACE  1,1,SOUTH", "LEFT", "RIGHT", "REPORT"]) == {1,1,"SOUTH"}
    assert ToyRobot.run(["PLACE  0,0,NORTH", "MOVE", "REPORT"]) == {0,1,"NORTH"}
    assert ToyRobot.run(["PLACE 0,0,NORTH","LEFT","REPORT"]) == {0,0,"WEST"}
    assert ToyRobot.run(["PLACE 1,2,EAST","MOVE","MOVE","LEFT","MOVE","REPORT"]) == {3,3,"NORTH"}
  end

  test "error case" do
    assert ToyRobot.run(["PLACE 4,4,EAST","MOVE","MOVE","LEFT","MOVE","REPORT"]) == "Robot cannot be moved further 5 units"
  end
end
