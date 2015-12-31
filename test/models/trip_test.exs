defmodule Mikeworks.TripTest do
  use Mikeworks.ModelCase

  alias Mikeworks.Trip

  @valid_attrs %{content: "some content", ended_at: "2010-04-17 14:00:00", location_lat: "some content", location_lng: "some content", location_name: "some content", started_at: "2010-04-17 14:00:00", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Trip.changeset(%Trip{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Trip.changeset(%Trip{}, @invalid_attrs)
    refute changeset.valid?
  end
end
