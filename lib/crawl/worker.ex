defmodule Crawl.Worker do
  require Logger

  def perform(book_id, link, from, to) do
    from..to
    |> Enum.each(fn number_chapter ->
      path = "#{link}-#{number_chapter}"

      Crawl.Crawler.get_content(path)
      |> case do
        {:ok, title, content} when content != [] ->
          Library.create_chapter(%{
            book_id: book_id,
            title: title,
            number_chapter: number_chapter,
            content: content
          })

        err ->
          Logger.error(err)
      end
    end)
  end
end
