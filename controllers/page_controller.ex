defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> render("index.html")
  end

  # # Redirection test
  # def index(conn, _params) do
  #   redirect(conn, to: "/redirect_test")
  # end

  # def redirect_test(conn, _params) do
  #   render(conn, "index.html")
  # end


 # Renders page with a layout
  # def index(conn, _params) do
  #   conn
  #   |> put_layout("admin.html")
  #   |> render("index.html")
  # end

  # def index(conn, _params) do
  #   render(conn, :index)
  # end

  # def index(conn, _params) do
  #   conn
  #   |> put_resp_content_type("text/plain")
  #   |> send_resp(201, "")
  # end

  # @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  # def index(conn, _params) do
  #   conn
  #   |> put_layout(false)
  #   |> render("index.html")
  # end

#   # Renders plaintext page without a layout
#   def show(conn, %{"messenger" => messenger}) do
#     text(conn, "From messenger #{messenger}")
#   end
# end

  # Render with assign funct
  def show(conn, %{"messenger" => messenger}) do
    conn
    |> Plug.Conn.assign(:messenger, messenger)
    |> render("show.html")
  end

  # Render with JSON text
  # def show(conn, %{"messenger" => messenger}) do
  #   json(conn, %{id: messenger})
  # end

end
