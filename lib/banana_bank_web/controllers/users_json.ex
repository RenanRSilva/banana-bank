defmodule BananaBankWeb.UsersJSON do
  alias BananaBank.Users.User

  def create(%{user: user}) do
    %{
      message: "Usuário criado com sucesso!",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      message: "User criado com sucesso!",
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end
end