defmodule Flightex.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  alias Flightex.Bookings.CreateOrUpdate
  alias Flightex.Users.Agent, as: UserAgent

  import Flightex.Factory

  describe "call/1" do
    setup do
      user = build(:user)

      Flightex.start_agents()

      UserAgent.save(user)

      {:ok, user: user}
    end

    test "when all parameters are valid, saves the user", %{user: user} do
      parameters = %{user_id: user.id, complete_date: "", local_origin: "", local_destination: "" }

      response = CreateOrUpdate.call(parameters)

      assert {:ok, _uuid} = response
    end
  end
end
