defmodule Mikeworks.Repo.Migrations.CreateTrip do
  use Ecto.Migration

  def change do
    create table(:trips) do
      add :title, :string
      add :started_at, :datetime
      add :ended_at, :datetime
      add :location_name, :string
      add :location_lat, :string
      add :location_lng, :string
      add :content, :string

      timestamps
    end

  end
end
