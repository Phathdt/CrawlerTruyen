defmodule Crawl.Writer do
  import Ecto.Query

  def perform(book_id) do
    File.rm("book.md")
    book = Library.get_book(book_id)

    save_results("# #{book.name}")

    save_results("## Mục lục")

    chapters =
      from(c in Library.Chapter,
        where: c.book_id == ^book_id and not is_nil(c.title),
        order_by: c.number_chapter
      )
      |> CrawlerTruyen.Repo.all()

    chapters
    |> Enum.each(fn chapter ->
      save_results("#{chapter.number_chapter}. [#{chapter.title}](##{stringtify(chapter.title)})")
    end)

    chapters
    |> Enum.each(fn chapter ->
      save_results("## #{chapter.title}")

      chapter.content
      |> String.split("\n")
      |> Enum.each(fn content ->
        save_results(content)

        save_results("")
      end)

      save_results("<div style='page-break-after: always;'></div>")
      save_results("")
    end)
  end

  def save_results(data) when is_list(data) do
    {:ok, file} = File.open("book.md", [:append, {:delayed_write, 100, 20}])
    Enum.each(data, &IO.binwrite(file, &1))
    File.close(file)
  end

  def save_results(data) do
    save_results(["#{data}\n"])
  end

  def stringtify(title) do
    title
    |> String.split(":")
    |> Enum.map(&String.trim/1)
    |> Enum.join(" ")
    |> String.downcase()
    |> String.replace(" ", "-")
    |> String.replace(",", "")
  end
end
