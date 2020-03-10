defmodule OffresContinentsTest do
  use ExUnit.Case

  describe "Compute, format and output as an ASCII table" do
    @map_counts %{
      {"Europe", "Tech"} => 3,
      {"Asie", "Tech"} => 2,
      {"Europe", "Marketing / Comm'"} => 1
    }

    test "Should retrieve columns" do
      assert OffresContinents.get_columns(@map_counts) == ["Tech", "Marketing / Comm'"]
    end

    test "Should create table headers" do
      assert OffresContinents.get_headers(@map_counts) == [
               "",
               "TOTAL",
               "Tech",
               "Marketing / Comm'"
             ]
    end

    test "Should create rows with zeros when needed" do
      assert OffresContinents.get_rows(@map_counts) == [["Asie", 2, 2, 0], ["Europe", 4, 3, 1]]
    end

    test "Should calculate the total for each category" do
      assert OffresContinents.get_totals_by_category(@map_counts) == ["TOTAL", 6, 5, 1]
    end

    test "Should get a full table with headers, totals and rows" do
      assert OffresContinents.get_full_table(@map_counts) == [
               ["", "TOTAL", "Tech", "Marketing / Comm'"],
               ["TOTAL", 6, 5, 1],
               ["Asie", 2, 2, 0],
               ["Europe", 4, 3, 1]
             ]
    end

    test "Should render the table in the console" do
      assert OffresContinents.render_table(@map_counts) == :ok
    end
  end

  describe "CSV manipulation" do
    test "Should get a stream from a CSV" do
      jobstream = OffresContinents.stream_csv('./data/technical-test-jobs.csv')

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

    test "Should fetch the job category from the profession_id" do
      assert false
    end
  end
end
