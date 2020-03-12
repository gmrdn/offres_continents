defmodule RearrangeData do
  def stream_csv(file) do
    file
    |> File.stream!()
    |> CSV.decode(separator: ?,, headers: true)
    |> Stream.map(fn {:ok, map} -> map end)
  end

  def get_continents_table() do
    jsontable =
      "{\"AD\":\"Europe\",\"AE\":\"Asie\",\"AF\":\"Asie\",\"AG\":\"Amérique du Nord\",\"AI\":\"Amérique du Nord\",\"AL\":\"Europe\",\"AM\":\"Asie\",\"AN\":\"Amérique du Nord\",\"AO\":\"Afrique\",\"AQ\":\"Antarctique\",\"AR\":\"Amérique du Sud\",\"AS\":\"Océanie\",\"AT\":\"Europe\",\"AU\":\"Océanie\",\"AW\":\"Amérique du Nord\",\"AZ\":\"Asie\",\"BA\":\"Europe\",\"BB\":\"Amérique du Nord\",\"BD\":\"Asie\",\"BE\":\"Europe\",\"BF\":\"Afrique\",\"BG\":\"Europe\",\"BH\":\"Asie\",\"BI\":\"Afrique\",\"BJ\":\"Afrique\",\"BM\":\"Amérique du Nord\",\"BN\":\"Asie\",\"BO\":\"Amérique du Sud\",\"BR\":\"Amérique du Sud\",\"BS\":\"Amérique du Nord\",\"BT\":\"Asie\",\"BW\":\"Afrique\",\"BY\":\"Europe\",\"BZ\":\"Amérique du Nord\",\"CA\":\"Amérique du Nord\",\"CC\":\"Asie\",\"CD\":\"Afrique\",\"CF\":\"Afrique\",\"CG\":\"Afrique\",\"CH\":\"Europe\",\"CI\":\"Afrique\",\"CK\":\"Océanie\",\"CL\":\"Amérique du Sud\",\"CM\":\"Afrique\",\"CN\":\"Asie\",\"CO\":\"Amérique du Sud\",\"CR\":\"Amérique du Nord\",\"CU\":\"Amérique du Nord\",\"CV\":\"Afrique\",\"CX\":\"Asie\",\"CY\":\"Asie\",\"CZ\":\"Europe\",\"DE\":\"Europe\",\"DJ\":\"Afrique\",\"DK\":\"Europe\",\"DM\":\"Amérique du Nord\",\"DO\":\"Amérique du Nord\",\"DZ\":\"Afrique\",\"EC\":\"Amérique du Sud\",\"EE\":\"Europe\",\"EG\":\"Afrique\",\"EH\":\"Afrique\",\"ER\":\"Afrique\",\"ES\":\"Europe\",\"ET\":\"Afrique\",\"FI\":\"Europe\",\"FJ\":\"Océanie\",\"FK\":\"Amérique du Sud\",\"FM\":\"Océanie\",\"FO\":\"Europe\",\"FR\":\"Europe\",\"GA\":\"Afrique\",\"GB\":\"Europe\",\"GD\":\"Amérique du Nord\",\"GE\":\"Asie\",\"GF\":\"Amérique du Sud\",\"GG\":\"Europe\",\"GH\":\"Afrique\",\"GI\":\"Europe\",\"GL\":\"Amérique du Nord\",\"GM\":\"Afrique\",\"GN\":\"Afrique\",\"GP\":\"Amérique du Nord\",\"GQ\":\"Afrique\",\"GR\":\"Europe\",\"GS\":\"Antarctique\",\"GT\":\"Amérique du Nord\",\"GU\":\"Océanie\",\"GW\":\"Afrique\",\"GY\":\"Amérique du Sud\",\"HK\":\"Asie\",\"HN\":\"Amérique du Nord\",\"HR\":\"Europe\",\"HT\":\"Amérique du Nord\",\"HU\":\"Europe\",\"ID\":\"Asie\",\"IE\":\"Europe\",\"IL\":\"Asie\",\"IM\":\"Europe\",\"IN\":\"Asie\",\"IO\":\"Asie\",\"IQ\":\"Asie\",\"IR\":\"Asie\",\"IS\":\"Europe\",\"IT\":\"Europe\",\"JE\":\"Europe\",\"JM\":\"Amérique du Nord\",\"JO\":\"Asie\",\"JP\":\"Asie\",\"KE\":\"Afrique\",\"KG\":\"Asie\",\"KH\":\"Asie\",\"KI\":\"Océanie\",\"KM\":\"Afrique\",\"KN\":\"Amérique du Nord\",\"KP\":\"Asie\",\"KR\":\"Asie\",\"KW\":\"Asie\",\"KY\":\"Amérique du Nord\",\"KZ\":\"Asie\",\"LA\":\"Asie\",\"LB\":\"Asie\",\"LC\":\"Amérique du Nord\",\"LI\":\"Europe\",\"LK\":\"Asie\",\"LR\":\"Afrique\",\"LS\":\"Afrique\",\"LT\":\"Europe\",\"LU\":\"Europe\",\"LV\":\"Europe\",\"LY\":\"Afrique\",\"MA\":\"Afrique\",\"MC\":\"Europe\",\"MD\":\"Europe\",\"ME\":\"Europe\",\"MG\":\"Afrique\",\"MH\":\"Océanie\",\"MK\":\"Europe\",\"ML\":\"Afrique\",\"MM\":\"Asie\",\"MN\":\"Asie\",\"MO\":\"Asie\",\"MP\":\"Océanie\",\"MQ\":\"Amérique du Nord\",\"MR\":\"Afrique\",\"MS\":\"Amérique du Nord\",\"MT\":\"Europe\",\"MU\":\"Afrique\",\"MV\":\"Asie\",\"MW\":\"Afrique\",\"MX\":\"Amérique du Nord\",\"MY\":\"Asie\",\"MZ\":\"Afrique\",\"NA\":\"Afrique\",\"NC\":\"Océanie\",\"NE\":\"Afrique\",\"NF\":\"Océanie\",\"NG\":\"Afrique\",\"NI\":\"Amérique du Nord\",\"NL\":\"Europe\",\"NO\":\"Europe\",\"NP\":\"Asie\",\"NR\":\"Océanie\",\"NU\":\"Océanie\",\"NZ\":\"Océanie\",\"OM\":\"Asie\",\"PA\":\"Amérique du Nord\",\"PE\":\"Amérique du Sud\",\"PF\":\"Océanie\",\"PG\":\"Océanie\",\"PH\":\"Asie\",\"PK\":\"Asie\",\"PL\":\"Europe\",\"PM\":\"Amérique du Nord\",\"PN\":\"Océanie\",\"PR\":\"Amérique du Nord\",\"PS\":\"Asie\",\"PT\":\"Europe\",\"PW\":\"Océanie\",\"PY\":\"Amérique du Sud\",\"QA\":\"Asie\",\"RE\":\"Afrique\",\"RO\":\"Europe\",\"RS\":\"Europe\",\"RU\":\"Europe\",\"RW\":\"Afrique\",\"SA\":\"Asie\",\"SB\":\"Océanie\",\"SC\":\"Afrique\",\"SD\":\"Afrique\",\"SE\":\"Europe\",\"SG\":\"Asie\",\"SH\":\"Afrique\",\"SI\":\"Europe\",\"SJ\":\"Europe\",\"SK\":\"Europe\",\"SL\":\"Afrique\",\"SM\":\"Europe\",\"SN\":\"Afrique\",\"SO\":\"Afrique\",\"SR\":\"Amérique du Sud\",\"ST\":\"Afrique\",\"SV\":\"Amérique du Nord\",\"SY\":\"Asie\",\"SZ\":\"Afrique\",\"TC\":\"Amérique du Nord\",\"TD\":\"Afrique\",\"TF\":\"Antarctique\",\"TG\":\"Afrique\",\"TH\":\"Asie\",\"TJ\":\"Asie\",\"TK\":\"Océanie\",\"TM\":\"Asie\",\"TN\":\"Afrique\",\"TO\":\"Océanie\",\"TR\":\"Asie\",\"TT\":\"Amérique du Nord\",\"TV\":\"Océanie\",\"TW\":\"Asie\",\"TZ\":\"Afrique\",\"UA\":\"Europe\",\"UG\":\"Afrique\",\"US\":\"Amérique du Nord\",\"UY\":\"Amérique du Sud\",\"UZ\":\"Asie\",\"VC\":\"Amérique du Nord\",\"VE\":\"Amérique du Sud\",\"VG\":\"Amérique du Nord\",\"VI\":\"Amérique du Nord\",\"VN\":\"Asie\",\"VU\":\"Océanie\",\"WF\":\"Océanie\",\"WS\":\"Océanie\",\"YE\":\"Asie\",\"YT\":\"Afrique\",\"ZA\":\"Afrique\",\"ZM\":\"Afrique\",\"ZW\":\"Afrique\"}"

    Poison.decode!(jsontable)
  end

  def get_categories_table() do
    './data/technical-test-professions.csv'
    |> File.stream!()
    |> CSV.decode(separator: ?,, headers: true)
    |> Enum.map(fn {:ok, map} -> map end)
  end

  def get_continent_by_country(country, table) do
    Map.fetch!(table, country)
  end

  def get_continent_by_geoloc(continent_table, {lat, lon}, call_geoloc_api \\ &Geocoder.call/1)
      when is_binary(lat) and is_binary(lon) do
    {:ok, loc} = call_geoloc_api.({String.to_float(lat), String.to_float(lon)})

    country =
      Map.fetch!(loc, :location)
      |> Map.fetch!(:country_code)
      |> String.upcase()

    Map.fetch!(continent_table, country)
  end

  def get_continent_by_geoloc_json(geojson, {lat, lon})
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

  def get_mapped_stream(stream, call_geoloc_api \\ &Geocoder.call/1) do
    # continents_table = get_continents_table()
    categories_table = get_categories_table()

    geojson =
      Poison.decode!(File.read!('./data/continents-simplified.json')) |> Geo.JSON.decode!()

    stream
    |> Stream.filter(fn x ->
      x["profession_id"] != "" and x["office_latitude"] != "" and
        x["office_longitude"] != ""
    end)
    # |> Stream.map(&IO.inspect(&1))
    |> Stream.map(fn x ->
      {
        # get_continent_by_geoloc(
        #   continents_table,
        #   {x["office_latitude"], x["office_longitude"]},
        #   call_geoloc_api),
        get_continent_by_geoloc_json(
          geojson,
          {x["office_latitude"], x["office_longitude"]}
        ),
        get_category_by_job(categories_table, x["profession_id"])
      }
    end)
  end
end
