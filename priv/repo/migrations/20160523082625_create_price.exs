defmodule PhoenixTest.Repo.Migrations.CreatePrice do
  use Ecto.Migration

  def change do
    create table(:prices) do
      add :from_date, :datetime
      add :thru_date, :datetime
      add :min_quantity, :integer
      add :price, :integer
      add :product_id, references(:products, on_delete: :nothing)

      timestamps
    end
    create index(:prices, [:product_id])

  end
end
