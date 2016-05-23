defmodule PhoenixTest.PriceControllerTest do
  use PhoenixTest.ConnCase

  alias PhoenixTest.Price
  @valid_attrs %{from_date: "2010-04-17 14:00:00", min_quantity: 42, price: 42, thru_date: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, price_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing prices"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, price_path(conn, :new)
    assert html_response(conn, 200) =~ "New price"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, price_path(conn, :create), price: @valid_attrs
    assert redirected_to(conn) == price_path(conn, :index)
    assert Repo.get_by(Price, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, price_path(conn, :create), price: @invalid_attrs
    assert html_response(conn, 200) =~ "New price"
  end

  test "shows chosen resource", %{conn: conn} do
    price = Repo.insert! %Price{}
    conn = get conn, price_path(conn, :show, price)
    assert html_response(conn, 200) =~ "Show price"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, price_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    price = Repo.insert! %Price{}
    conn = get conn, price_path(conn, :edit, price)
    assert html_response(conn, 200) =~ "Edit price"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    price = Repo.insert! %Price{}
    conn = put conn, price_path(conn, :update, price), price: @valid_attrs
    assert redirected_to(conn) == price_path(conn, :show, price)
    assert Repo.get_by(Price, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    price = Repo.insert! %Price{}
    conn = put conn, price_path(conn, :update, price), price: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit price"
  end

  test "deletes chosen resource", %{conn: conn} do
    price = Repo.insert! %Price{}
    conn = delete conn, price_path(conn, :delete, price)
    assert redirected_to(conn) == price_path(conn, :index)
    refute Repo.get(Price, price.id)
  end
end
