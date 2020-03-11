use Mix.Config

config :geocoder, :worker_pool_config, size: 40, max_overflow: 20

config :geocoder, :worker,
  # OpenStreetMaps or OpenCageData are other supported providers
  provider: Geocoder.Providers.OpenStreetMaps,
  key: System.get_env("GEOCODER_GOOGLE_API_KEY")
