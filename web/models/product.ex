defmodule PhoenixTest.Product do
  use PhoenixTest.Web, :model

  schema "products" do
    field :product_name, :string
    field :description, :string
    field :comments, :string
    field :sales_introduction_date, Ecto.DateTime
    field :sales_discontinuation_date, Ecto.DateTime
    field :sales_disc_when_not_avail, :boolean, default: false
    field :support_discontinuation_date, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(product_name description comments sales_introduction_date sales_discontinuation_date sales_disc_when_not_avail support_discontinuation_date)
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
