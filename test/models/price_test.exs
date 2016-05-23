defmodule PhoenixTest.PriceTest do
  use PhoenixTest.ModelCase

  alias PhoenixTest.Price

  @valid_attrs %{from_date: "2010-04-17 14:00:00", min_quantity: 42, price: 42, thru_date: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Price.changeset(%Price{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Price.changeset(%Price{}, @invalid_attrs)
    refute changeset.valid?
  end
end
