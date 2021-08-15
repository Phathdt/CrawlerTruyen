defmodule Library.Chapter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chapters" do
    field(:title, :string)
    field(:number_chapter, :integer)
    field(:content, :string)

    belongs_to(:book, Library.Book)
    timestamps()
  end

  @default_fields [
    :id,
    :inserted_at,
    :updated_at
  ]

  @required_fields [:book_id]

  @doc false
  def changeset(chapter, attrs) do
    chapter
    |> cast(attrs, __MODULE__.__schema__(:fields) -- @default_fields)
    |> validate_required(@required_fields)
  end
end
