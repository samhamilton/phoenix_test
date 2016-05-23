defmodule PhoenixTest.PriceController do
  use PhoenixTest.Web, :controller

  alias PhoenixTest.Price

  plug :scrub_params, "price" when action in [:create, :update]

  def index(conn, _params) do
    prices = Repo.all(Price)
    render(conn, "index.html", prices: prices)
  end

  def new(conn, _params) do
    changeset = Price.changeset(%Price{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"price" => price_params}) do
    changeset = Price.changeset(%Price{}, price_params)

    case Repo.insert(changeset) do
      {:ok, _price} ->
        conn
        |> put_flash(:info, "Price created successfully.")
        |> redirect(to: price_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    price = Repo.get!(Price, id)
    render(conn, "show.html", price: price)
  end

  def edit(conn, %{"id" => id}) do
    price = Repo.get!(Price, id)
    changeset = Price.changeset(price)
    render(conn, "edit.html", price: price, changeset: changeset)
  end

  def update(conn, %{"id" => id, "price" => price_params}) do
    price = Repo.get!(Price, id)
    changeset = Price.changeset(price, price_params)

    case Repo.update(changeset) do
      {:ok, price} ->
        conn
        |> put_flash(:info, "Price updated successfully.")
        |> redirect(to: price_path(conn, :show, price))
      {:error, changeset} ->
        render(conn, "edit.html", price: price, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    price = Repo.get!(Price, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(price)

    conn
    |> put_flash(:info, "Price deleted successfully.")
    |> redirect(to: price_path(conn, :index))
  end
end
