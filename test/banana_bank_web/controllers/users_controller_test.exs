defmodule BananaBankWeb.UsersControllerTest do
  use BananaBankWeb.ConnCase

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do

      params = %{
        name: "João",
        cep: "12345678",
        email: "joao@frutas.com",
        password: "123456"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)


        assert %{"data" => %{"cep" => "12345678", "email" => "joao@frutas.com", "id" => _id, "name" => "João"}, "message" => "Usuário criado com sucesso!"} = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{
        name: nil,
        cep: "12",
        email: "joao@frutas.com",
        password: "1"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

        assert %{"errors" => %{"cep" => ["should be 8 character(s)"]}} = response
    end
  end
end
