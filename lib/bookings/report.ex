defmodule Flightex.Bookings.Report do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def create(filename \\ "report.csv") do
    flight_list = build_flight_list()

    File.write(filename, flight_list)
  end

  defp build_flight_list() do
    BookingAgent.list_all()
    |> Map.values()
    |> Enum.map(fn flight -> flight_string(flight) end)
  end

  defp flight_string(%Booking{id: id, user_id: user_id, complete_date: complete_date, local_origin: local_origin, local_destination: local_destination}) do
    "#{user_id}, #{local_origin}, #{local_destination}, #{NaiveDateTime.to_string(complete_date)}\n"
  end
end
