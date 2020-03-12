defmodule OffresContinentsTest do
  use ExUnit.Case

  describe "Rearrange and render" do
    test "Should run the job completely from a CSV file and render the ASCII table" do
      assert OffresContinents.run() == :ok
    end
  end
end
