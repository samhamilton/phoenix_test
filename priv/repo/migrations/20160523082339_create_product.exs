defmodule PhoenixTest.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_name, :string
      add :description, :string
      add :comments, :string
      add :sales_introduction_date, :datetime
      add :sales_discontinuation_date, :datetime
      add :sales_disc_when_not_avail, :boolean, default: false
      add :support_discontinuation_date, :datetime

      timestamps
    end

  end
end
