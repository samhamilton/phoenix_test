defmodule PhoenixTest.ProductTest do
  use PhoenixTest.ModelCase

  alias PhoenixTest.Product

  @valid_attrs %{comments: "some content", description: "some content", product_name: "some content", sales_disc_when_not_avail: true, sales_discontinuation_date: "2010-04-17 14:00:00", sales_introduction_date: "2010-04-17 14:00:00", support_discontinuation_date: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
