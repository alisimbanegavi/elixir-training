defmodule HelloWeb.LayoutView do
  use HelloWeb, :view

  def title() do
    "Awesome New Title!"
  end
  # Displayed within template by use of '<title><%= title() %></title>' in line 7 of hello_web/templates/layout/app.html.eex
end
