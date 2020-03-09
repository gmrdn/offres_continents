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
      [
        continent
        | [
            ""
            | Enum.map(columns, fn column ->
                get_nb_for_continent_and_category(sum_by_continent_and_type, {continent, column})
              end)
          ]
      ]
    end)
  end

  defp get_nb_for_continent_and_category(collection, continent_category_tuple) do
    case List.keyfind(collection, continent_category_tuple, 0) do
      nil -> 0
      {_, nb} -> nb
    end
  end

  def get_totals_by_category(collection) do
    columns = get_columns(collection)

    [
      "TOTAL"
      | [
          ""
          | columns
            |> Enum.map(fn col ->
              collection
              |> Enum.filter(fn {{_a, b}, _c} -> b == col end)
              |> Enum.map(fn {{_a, _b}, c} -> c end)
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
end
