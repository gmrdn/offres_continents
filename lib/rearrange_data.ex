defmodule RearrangeData do
  @continents_geojson './data/continents-simplified.json'
  @categories_csv './data/technical-test-professions.csv'

  def stream_csv(file) do
    file
    |> File.stream!()
    |> CSV.decode(separator: ?,, headers: true)
    |> Stream.map(fn {:ok, map} -> map end)
  end

  def get_categories_table() do
    @categories_csv
    |> File.stream!()
    |> CSV.decode(separator: ?,, headers: true)
    |> Enum.map(fn {:ok, map} -> map end)
  end

  def get_continent_by_geoloc(geojson, {lat, lon})
      when is_binary(lat) and is_binary(lon) do
    loc =
      Enum.filter(geojson.geometries, fn x ->
        Topo.contains?(x, {String.to_float(lon), String.to_float(lat)})
      end)

    if loc == [] do
      IO.inspect({lat, lon})
      "Unknown"
    else
      c = List.first(loc)
      c.properties["continent"]
    end
  end

  def get_category_by_job(table, job_id) do
    Enum.filter(table, fn x -> x["id"] == job_id end)
    |> Enum.map(fn x -> x["category_name"] end)
    |> List.first()
  end

  def get_continents_table() do
    Poison.decode!(File.read!(@continents_geojson)) |> Geo.JSON.decode!()
  end

  def get_mapped_stream(stream) do
    categories_table = get_categories_table()

    geojson = get_continents_table()

    stream
    |> Stream.filter(fn x ->
      x["profession_id"] != "" and x["office_latitude"] != "" and
        x["office_longitude"] != ""
    end)
    |> Stream.map(fn x ->
      {
        get_continent_by_geoloc(
          geojson,
          {x["office_latitude"], x["office_longitude"]}
        ),
        get_category_by_job(categories_table, x["profession_id"])
      }
    end)
  end
end
