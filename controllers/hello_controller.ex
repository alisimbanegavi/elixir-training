defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  # Basic HTML rendering
  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: messenger)
  end

  # def show(conn, %{"messenger" => messenger}) do
  #   json(conn, %{id: messenger})
  # end

  # If the body of the action needs access to the full map of parameters bound to the params variable
  # in addition to the bound messenger variable, we could define show/2 like this:

  # def show(conn, %{"messenger" => messenger} = params) do
  #   ...
  # end

  # The keys to the params map will always be strings
  # The equals sign does not represent assignment, but is instead a pattern match assertion.

    # Render with HTML w/o using view
    # def show(conn, %{"messenger" => messenger}) do
    #   html(conn, """
    #  <html>
    #    <head>
    #       <title>Passing a Messenger</title>
    #    </head>
    #    <body>
    #      <p>From messenger #{Plug.HTML.html_escape(messenger)}</p>
    #    </body>
    #  </html>
    # """)
    # end
end

# All controller actions take two arguments
# First is conn, a struct which holds a ton of data about the request
# Second is the request parameters
# The core of this action is render(conn, "index.html") which tells Phoenix to render index.html
