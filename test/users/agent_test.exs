defmodule Flightex.Users.AgentTest do
  use ExUnit.Case

  alias Flightex.Users.Agent, as: UserAgent

  import Flightex.Factory

  describe "save/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "saves the user" do
      user = build(:user)

      response = UserAgent.save(user)

      assert { :ok, _id } = response
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when the user is found, returns the user" do
      user = build(:user)

      {:ok, id} = UserAgent.save(user)

      response = UserAgent.get(id)

      expected_response = {:ok, user}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("000000000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
