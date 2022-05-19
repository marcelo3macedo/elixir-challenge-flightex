defmodule Flightex.Bookings.AgentTest do
  use ExUnit.Case

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Users.Agent, as: UserAgent

  import Flightex.Factory

  describe "save/1" do
    setup do
      user = build(:user)

      Flightex.start_agents()

      UserAgent.save(user)

      {:ok, user: user}
    end

    test "saves the booking" do
      booking = build(:booking)

      response = BookingAgent.save(booking)

      assert { :ok, _id } = response
    end
  end

  describe "get/1" do
    setup do
      user = build(:user)

      Flightex.start_agents()

      UserAgent.save(user)

      {:ok, user: user}
    end

    test "when the booking is found, returns the booking" do
      booking = build(:booking)

      {:ok, id} = BookingAgent.save(booking)

      response = BookingAgent.get(id)

      expected_response = {:ok, booking}

      assert response == expected_response
    end

    test "when the booking is not found, returns an error" do
      response = BookingAgent.get("000000000000")

      expected_response = {:error, "Booking not found"}

      assert response == expected_response
    end
  end
end
