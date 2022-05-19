defmodule Flightex.Bookings.CreateOrUpdate do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.User

  def call(%{user_id: user_id, local_origin: local_origin, local_destination: local_destination }) do
    with {:ok, user} <- UserAgent.get(user_id),
         {:ok, booking} <- Booking.build(user, local_origin, local_destination) do
      BookingAgent.save(booking)
    else
      error -> error
    end
  end

end
