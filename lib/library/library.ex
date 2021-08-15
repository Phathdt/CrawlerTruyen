defmodule Library do
  import Ecto.Query, warn: false
  alias CrawlerTruyen.Repo

  alias Library.Book
  def get_book(id), do: Repo.get(Book, id)

  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  alias Library.Chapter

  def get_chapter(id), do: Repo.get(Chapter, id)

  def create_chapter(attrs \\ %{}) do
    %Chapter{}
    |> Chapter.changeset(attrs)
    |> Repo.insert()
  end

  def change_chapter(chapter, params \\ %{})

  def change_chapter(%Chapter{} = chapter, params) do
    Chapter.changeset(chapter, params)
  end
end
