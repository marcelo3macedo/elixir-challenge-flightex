defmodule Flightex.Users.User do
  @keys [:id, :name, :email, :cpf]
  @enforce_keys [:name, :email, :cpf]

  defstruct @keys

  def build(name, email, cpf) do
    {:ok,
    %__MODULE__ {
      id: UUID.uuid4(),
      name: name,
      email: email,
      cpf: cpf
    }}
  end

  def build(_name, _mail, _cpf), do: {:error, "Invalid Parameters"}
end
