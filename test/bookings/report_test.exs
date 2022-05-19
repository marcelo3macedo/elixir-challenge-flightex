defmodule Flightex.Bookings.ReportTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Report

  describe "create/1" do
    test "create the report file" do
      BookingAgent.start_link(%{})

      booking = build(:booking)

      BookingAgent.save(booking)

      expected_response = "1, Teste, Teste, #{NaiveDateTime.to_string(booking.complete_date)}\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
