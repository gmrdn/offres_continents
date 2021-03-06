defmodule RearrangeDataTest do
  use ExUnit.Case

  describe "CSV manipulation" do
    test "Should get a stream from a CSV" do
      jobstream = RearrangeData.stream_csv('./data/technical-test-jobs.csv')

      assert Enum.take(jobstream, 1) == [
               %{
                 "contract_type" => "INTERNSHIP",
                 "name" =>
                   "[Louis Vuitton Germany] Praktikant (m/w) im Bereich Digital Retail (E-Commerce)",
                 "office_latitude" => "48.1392154",
                 "office_longitude" => "11.5781413",
                 "profession_id" => "7"
               }
             ]
    end
  end

  describe "Parse a stream, fetch job category and job continent" do
    @jobs [
      %{
        "contract_type" => "INTERNSHIP",
        "name" =>
          "[Louis Vuitton Germany] Praktikant (m/w) im Bereich Digital Retail (E-Commerce)",
        "office_latitude" => "48.1392154",
        "office_longitude" => "11.5781413",
        "profession_id" => "7"
      },
      %{
        "contract_type" => "INTERNSHIP",
        "name" => "Bras droit de la fondatrice",
        "office_latitude" => "48.885247",
        "office_longitude" => "2.3566441",
        "profession_id" => "5"
      },
      %{
        "contract_type" => "FULL_TIME",
        "name" => "[Louis Vuitton North America] Team Manager, RTW - NYC",
        "office_latitude" => "40.7630463",
        "office_longitude" => "-73.973527",
        "profession_id" => "31"
      }
    ]

    test "Should fetch the continent for the job's latitude and longitude" do
      geojson = RearrangeData.get_continents_table()

      continent =
        RearrangeData.get_continent_by_geoloc(
          geojson,
          {"48.1392154", "11.5781413"}
        )

      assert continent == "Europe"
    end

    test "Should classify locations as Unknown when it can't be found in the geojson table" do
      geojson = RearrangeData.get_continents_table()

      continent =
        RearrangeData.get_continent_by_geoloc(
          geojson,
          {"78.2178086", "15.6573606"}
        )

      assert continent == "Unknown"
    end

    test "Should replace stream lines by continent value and job category" do
      stream = Stream.cycle(@jobs)

      assert List.first(Enum.take(RearrangeData.get_mapped_stream(stream), 1)) ==
               {"Europe", "Marketing / Comm'"}
    end
  end
end
