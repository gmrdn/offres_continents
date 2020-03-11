defmodule OffresContinentsTest do
  use ExUnit.Case

  describe "Rearrange and render" do
    test "Should run the job completely from a CSV file (mocked API) and render the ASCII table" do
      mock_geoloc_api = fn _ ->
        send(
          self(),
          {:ok,
           %Geocoder.Coords{
             location: %Geocoder.Location{
               country_code: "fr"
             }
           }}
        )
      end

      assert OffresContinents.run(mock_geoloc_api) == :ok
    end
  end
end
