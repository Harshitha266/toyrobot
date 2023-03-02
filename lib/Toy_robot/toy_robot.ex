defmodule ToyRobot.ToyRobot do
  @table_width 5
  @table_height 5

  def run(input) do
    robot = %{x: 0, y: 0, facing: "NORTH"}
    input
    |> loop(robot)
  end

  defp loop([input|rest],robot) do
    case String.upcase(input) do
      "PLACE " <> rest_command ->
        new_robot = place_robot(robot, rest_command)
        loop(rest,new_robot)

      "MOVE" ->
          new_robot = move_robot(robot)
          case is_map(new_robot) do
            true -> loop(rest,new_robot)
            false -> "Robot cannot be moved further 5 units"
          end

      "LEFT" ->
        new_robot = turn_left(robot)
        loop(rest,new_robot)

      "RIGHT" ->
        new_robot = turn_right(robot)
        loop(rest,new_robot)

      "REPORT" ->
        report_robot(robot)


      "EXIT" ->
        :ok

      x ->
        {:error,"invalid command given #{x}"}
    end
  end

  defp place_robot(robot, args) do
    [x, y, facing] = String.split(String.trim(args), ",")
     x = String.to_integer(x)
     y = String.to_integer(y)
    valid_position?(x, y)

    if valid_position?(x, y) do
      %{robot | x: x, y: y, facing: String.upcase(facing)}
    else
      IO.puts "Invalid position, please try again"
      robot
    end

  end

  defp move_robot(robot) do
    case robot.facing do
      "NORTH" ->
        new_y = robot.y + 1
        if valid_position?(robot.x, new_y) do
          %{robot | y: new_y}
        else
          "Robot cannot be moved further #{robot.x} and #{robot.y}"
        end

      "SOUTH" ->
        new_y = robot.y - 1
        if valid_position?(robot.x, new_y) do
          %{robot | y: new_y}
        else
          "Robot cannot be moved further #{robot.x} and #{robot.y}"
        end

      "EAST" ->
        new_x = robot.x + 1
        if valid_position?(new_x, robot.y) do
          %{robot | x: new_x}
        else
          "Robot cannot be moved further #{robot.x} and #{robot.y}"
        end

      "WEST" ->
        new_x = robot.x - 1
        if valid_position?(new_x, robot.y) do
          %{robot | x: new_x}
        else
          "Robot cannot be moved further #{robot.x} and #{robot.y}"
        end

      x ->
        "Robot cannot be moved to #{x} "
        robot
    end
  end

  defp turn_left(robot) do
    case robot.facing do
      "NORTH" -> %{robot | facing: "WEST"}
      "SOUTH" -> %{robot | facing: "EAST"}
      "EAST" -> %{robot | facing: "NORTH"}
      "WEST" -> %{robot | facing: "SOUTH"}
      _ -> robot
    end
  end

  defp turn_right(robot) do
    case robot.facing do
      "NORTH" -> %{robot | facing: "EAST"}
      "SOUTH" -> %{robot | facing: "WEST"}
      "EAST" -> %{robot | facing: "SOUTH"}
      "WEST" -> %{robot | facing: "NORTH"}
      _ -> robot
    end
  end


  defp report_robot(robot) do
    {robot.x,robot.y,robot.facing}
  end

  defp valid_position?(x, y) do
      x in 0..@table_width-1 and y in 0..@table_height-1
  end
  end
