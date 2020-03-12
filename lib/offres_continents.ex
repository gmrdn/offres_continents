defmodule OffresContinents do
  def run() do
    './data/technical-test-jobs.csv'
    |> RearrangeData.stream_csv()
    |> RearrangeData.get_mapped_stream()
    |> Enum.frequencies()
    |> RenderTable.render_table()
  end
end
