defmodule OffresContinentsTest do
  use ExUnit.Case

  @map_counts %{
    {"Europe", "Tech"} => 3,
    {"Asie", "Tech"} => 2,
    {"Europe", "Marketing / Comm'"} => 1
  }

  test "Should retrieve columns" do
    assert OffresContinents.get_columns(@map_counts) == ["Tech", "Marketing / Comm'"]
  end

  test "Should create table headers" do
    assert OffresContinents.get_headers(@map_counts) == ["", "TOTAL", "Tech", "Marketing / Comm'"]
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
