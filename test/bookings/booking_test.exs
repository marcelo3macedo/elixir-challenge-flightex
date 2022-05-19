defmodule Flightex.Bookings.BookingTest do
  alias Flightex.Bookings.Booking
  alias Flightex.Users.Agent, as: UserAgent

  use ExUnit.Case

  import Flightex.Factory

  describe "build/4" do
    setup do
      user = build(:user)

      Flightex.start_agents()

      UserAgent.save(user)

      {:ok, user: user}
    end

    test "when all parameters are valid, returns the booking", %{user: user} do
      response = Booking.build(
        user,
        "local A",
        "local B"
      )

      assert {:ok, _booking} = response
    end
  end
end
