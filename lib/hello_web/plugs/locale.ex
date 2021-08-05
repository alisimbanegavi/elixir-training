defmodule HelloWeb.Plugs.Locale do
  import Plug.Conn

  # Module plug that puts the :locale key and value into the connection assign for downstream use in other plugs, controller actions, and our views

  @locales ["en", "fr", "de"]

  def init(default), do: default
  # We pass a default locale to use if none is present in the params.

  def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
    assign(conn, :locale, loc)
  end

  def call(conn, default) do
    assign(conn, :locale, default)
  end
end
