defmodule CrawlerTruyen.Repo.Migrations.CreateTableChapter do
  use Ecto.Migration

  def change do
    create table(:chapters) do
      add(:title, :text)
      add(:number_chapter, :integer)
      add(:content, :text)
      add(:book_id, references(:books, on_delete: :nothing))

      timestamps(default: fragment("NOW()"))
    end
  end
end
