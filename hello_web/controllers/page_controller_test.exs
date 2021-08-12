defmodule HelloWeb.PageControllerTest do
  use HelloWeb.ConnCase

  # In this test, we access the root page of our application by a "GET" HTTP request on the path "/" with the get/2 macro
  # Then we assert that the rendered page contains the string "Welcome to Phoenix!".

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end

# When writing tests in Elixir, we use assertions to check that something is true
# In our case, assert html_response(conn, 200) =~ "Welcome to Phoenix!" is doing a couple things:
  # It asserts that conn has rendered a response
  # It asserts that the response has the 200 status code (which means OK in HTTP parlance)
  # It asserts that the type of the response is HTML
  # It asserts that the result of html_response(conn, 200), which is an HTML response, has the string "Welcome to Phoenix!" in it
