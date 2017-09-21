defmodule DispacherTest do
  use ExUnit.Case
  doctest Dispacher

  test "greets the world" do
    assert Dispacher.hello() == :world
  end
end
