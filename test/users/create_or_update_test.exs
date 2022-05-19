defmodule Flightex.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all parameters are valid, saves the user" do
      parameters = %{name: "teste", email: "teste@gmail.com", cpf: "79845612" }

      response = CreateOrUpdate.call(parameters)

      expected_response = {:ok, "User create or updated"}

      assert response == expected_response
    end
  end
end
