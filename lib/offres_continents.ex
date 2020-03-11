defmodule OffresContinents do
  def run(call_geoloc_api \\ &Geocoder.call/1) do
    './data/technical-test-jobs.csv'
    |> RearrangeData.stream_csv()
    |> RearrangeData.get_mapped_stream(call_geoloc_api)
    |> Enum.frequencies()
    |> RenderTable.render_table()
  end
end
