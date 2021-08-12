defmodule HelloWeb.ErrorViewTest do
  use HelloWeb.ConnCase, async: true
  # Setting async: true means that this test case will be run in parallel with other test cases ( whichincreases speeed overall)

  # We can run only the tests from the error view case by running 'mix test --only error_view_case'
  @moduletag :error_view_case #If we use an atom for a tag, it is assumed to equal true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(HelloWeb.ErrorView, "404.html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(HelloWeb.ErrorView, "500.html", []) == "Internal Server Error"
  end
end
