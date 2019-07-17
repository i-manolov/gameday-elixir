defmodule GamedayWeb.AuthController do
  use GamedayWeb, :controller

  plug(Ueberauth)

  alias Gameday.Accounts
  alias Gameday.Accounts.User

  def callback(
        %{assigns: %{ueberauth_auth: %Ueberauth.Auth{info: info, provider: provider}}} = conn,
        _params
      ) do
    %Ueberauth.Auth.Info{email: email} = info

    user_params = %{
      email: info.email,
      provider: Atom.to_string(provider)
    }

    signin(conn, user_params)
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.page_path(conn, :index))
  end

  defp signin(conn, user_params) do
    case find_or_insert_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error occured")

        # |> redirect(to: topic_path(conn, :index))
    end
  end

  defp find_or_insert_user(user_params) do
    case Accounts.get_user_by(email: user_params.email, provider: user_params.provider) do
      nil -> Accounts.create_user(user_params)
      user -> {:ok, user}
    end
  end
end
