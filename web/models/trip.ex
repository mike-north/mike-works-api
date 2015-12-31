defmodule Mikeworks.Trip do
  use Mikeworks.Web, :model

  schema "trips" do
    field :title, :string
    field :started_at, Ecto.DateTime
    field :ended_at, Ecto.DateTime
    field :location_name, :string
    field :location_lat, :string
    field :location_lng, :string
    field :content, :string

    timestamps
  end

  @required_fields ~w(title started_at ended_at location_name location_lat location_lng content)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
