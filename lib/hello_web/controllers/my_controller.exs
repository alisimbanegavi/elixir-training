defmodule HelloWeb.MyController do
  # Action Fall back example
  use Phoenix.Controller

  action_fallback HelloWeb.MyFallbackController # Referencing fallback controller


  # Show action which uses with to fetch a blog post and then authorize the current user to view that blog post
  # Whenever the with conditions don't match, HelloWeb.MyFallbackController receives the original conn & the result of the action
  def show(conn, %{"id" => id}, current_user) do
    with {:ok, post} <- fetch_post(id),
         :ok <- authorize_user(current_user, :view, post) do
      render(conn, "show.json", post: post)
    # Lines below negatedbc functionality has been referenced by action_fallback
    # else
    #   {:error, :not_found} -> # Post is not found
    #     conn
    #     |> put_status(:not_found)
    #     |> put_view(HelloWeb.ErrorView)
    #     |> render(:"404")

    #   {:error, :unauthorized} -> # User is not authorized
    #     conn
    #     |> put_status(403)
    #     |> put_view(HelloWeb.ErrorView)
    #     |> render(:"403")
    # end
  end

end
