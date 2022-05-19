defmodule Flightex.Factory do
  use ExMachina

  alias Flightex.Bookings.Booking
  alias Flightex.Users.User

  def user_factory do
      %User {
        id: "70dfd2b6-58c3-44f1-9560-69b27ec0e4ab",
        name: "Test User",
        email: "user@test.com",
        cpf: "12345678900"
      }
  end

  def booking_factory do
    %Booking{
      user_id: "1",
      complete_date: NaiveDateTime.utc_now(),
      local_origin: "Teste",
      local_destination: "Teste"
    }
  end
end
