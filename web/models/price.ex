defmodule PhoenixTest.Price do
  use PhoenixTest.Web, :model

  schema "prices" do
    field :from_date, Ecto.DateTime
    field :thru_date, Ecto.DateTime
    field :min_quantity, :integer
    field :price, :integer
    belongs_to :product, PhoenixTest.Product

    timestamps
  end

  @required_fields ~w(from_date thru_date min_quantity price)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
