defmodule OffresContinents do
  def get_columns(collection) do
    collection
    |> Map.keys()
    |> Enum.unzip()
    |> elem(1)
    |> Enum.uniq()
  end

  def get_headers(collection) do
    ["" | ["TOTAL" | get_columns(collection)]]
  end

  def get_rows(collection) do
    columns = get_columns(collection)

    collection
    |> Enum.group_by(fn {{a, _b}, _c} -> a end)
    |> Enum.map(fn {continent, sum_by_continent_and_type} ->
      [continent | get_sums_and_total(sum_by_continent_and_type, columns, continent)]
    end)
  end

  defp get_nb_for_continent_and_category(collection, continent_category_tuple) do
    case List.keyfind(collection, continent_category_tuple, 0) do
      nil -> 0
      {_, nb} -> nb
    end
  end

  defp get_sums_and_total(sum_by_continent_and_type, columns, continent) do
    sums_and_total =
      Enum.map_reduce(columns, 0, fn column, acc ->
        nb = get_nb_for_continent_and_category(sum_by_continent_and_type, {continent, column})
        {nb, acc + nb}
      end)

    [elem(sums_and_total, 1) | elem(sums_and_total, 0)]
  end

  def get_totals_by_category(collection) do
    columns = get_columns(collection)

    [
      "TOTAL"
      | [
          Enum.map(collection, fn {_, c} -> c end)
          |> Enum.sum()
          | columns
            |> Enum.map(fn col ->
              collection
              |> Enum.filter(fn {{_, category}, _} -> category == col end)
              |> Enum.map(fn {_, sum} -> sum end)
              |> Enum.sum()
            end)
        ]
    ]
  end

  def get_full_table(collection) do
    [get_headers(collection) | [get_totals_by_category(collection) | get_rows(collection)]]
  end

  def render_table(collection) do
    headers = get_headers(collection)
    rows = [get_totals_by_category(collection) | get_rows(collection)]

    TableRex.quick_render!(rows, headers)
    |> IO.puts()
  end

  def stream_csv(file) do
    file
    |> File.stream!()
    |> CSV.decode(separator: ?,, headers: true)
    |> Stream.map(fn {:ok, map} -> map end)
  end
end
