defmodule Crawl.Crawler do
  use Tesla
  require Logger

  plug(Tesla.Middleware.BaseUrl, "https://123truyen.com")

  @default_headers [
    {"user-agent",
     "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36"},
    {"accept", "application/json, text/javascript"},
    {"accept-language", "en-US,en;q=0.9"},
    {"connection", "keep-alive"}
  ]

  def get_content(path) do
    Logger.info("processing path #{path}")

    headers = @default_headers

    with {:ok, %{body: body}} <- get(path, headers: headers),
         {:ok, document} <- Floki.parse_document(body) do
      content =
        Floki.find(document, "#js-truyenkk-read-content")
        |> Floki.text()
        |> String.split(".")
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("\n")
        |> String.split("\n")
        |> Enum.map(&String.trim/1)
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("\n")
        |> String.split(".")
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("\n")

      title =
        Floki.find(document, ".chapter-title")
        |> Floki.text()
        |> String.split("\n")
        |> Enum.map(&String.trim/1)
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("\n")

      {:ok, title, content}
    else
      err ->
        {:error, err}
    end
  end
end
