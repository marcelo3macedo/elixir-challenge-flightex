defmodule Flightex.Bookings.Booking do
  alias Flightex.Users.User

  @keys [:id, :user_id, :complete_date, :local_origin, :local_destination]
  @enforce_keys [:user_id, :local_origin, :local_destination]

  defstruct @keys

  def build(%User{id: user_id}, local_origin, local_destination) do
    {:ok,
    %__MODULE__ {
      id: UUID.uuid4(),
      user_id: user_id,
      complete_date: NaiveDateTime.utc_now(),
      local_origin: local_origin,
      local_destination: local_destination
    }}
  end

  def build(_user, _local_origin, _local_destination), do: {:error, "Invalid Parameters"}
end
