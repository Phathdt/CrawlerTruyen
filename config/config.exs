import Config

config :crawler_truyen, CrawlerTruyen.Repo,
  pool_size: 10,
  queue_target: 1_000,
  queue_interval: 5_000,
  timeout: 60_00

config :crawler_truyen,
  ecto_repos: [CrawlerTruyen.Repo]
