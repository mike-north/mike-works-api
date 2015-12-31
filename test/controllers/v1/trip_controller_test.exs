defmodule Mikeworks.V1.TripControllerTest do
  use Mikeworks.ConnCase

  alias Mikeworks.Trip
  @valid_attrs %{content: "some content", ended_at: "2010-04-17 14:00:00", location_lat: "some content", location_lng: "some content", location_name: "some content", started_at: "2010-04-17 14:00:00", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, v1_trip_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    trip = Repo.insert! %Trip{}
    conn = get conn, v1_trip_path(conn, :show, trip)
    assert json_response(conn, 200)["data"] == %{"id" => trip.id,
      "title" => trip.title,
      "started_at" => trip.started_at,
      "ended_at" => trip.ended_at,
      "location_name" => trip.location_name,
      "location_lat" => trip.location_lat,
      "location_lng" => trip.location_lng,
      "content" => trip.content}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, v1_trip_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, v1_trip_path(conn, :create), trip: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Trip, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, v1_trip_path(conn, :create), trip: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    trip = Repo.insert! %Trip{}
    conn = put conn, v1_trip_path(conn, :update, trip), trip: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Trip, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    trip = Repo.insert! %Trip{}
    conn = put conn, v1_trip_path(conn, :update, trip), trip: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    trip = Repo.insert! %Trip{}
    conn = delete conn, v1_trip_path(conn, :delete, trip)
    assert response(conn, 204)
    refute Repo.get(Trip, trip.id)
  end
end
