defmodule CrawlerTruyen.Repo.Migrations.CreateTableTruyen do
  use Ecto.Migration

  def change do
    create table(:books) do
      add(:name, :text)

      timestamps(default: fragment("NOW()"))
    end
  end
end
