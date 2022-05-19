defmodule Flightex.Users.UserTest do
  alias Flightex.Users.User
  use ExUnit.Case

  describe "build/3" do
    test "when all parameters are valid, returns the user" do
      response = User.build(
        "teste",
        "teste@teste.com",
        "123456789"
      )

      assert {:ok, _user} = response
    end
  end
end
