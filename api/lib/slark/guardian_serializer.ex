defmodule Slark.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Sling.Repo
  alias Sling.User

  def for_token(user = %User{}), do: {:ok, "User: #{user.id}"}
  def for_token(_), do: {error, "unknown resource type"}

  def from_token("User:" <> id), do: {:ok, Repo.get(User, String.to_integer(id))}
  def from_token(_), do: {"Unknown resource type"}
end
