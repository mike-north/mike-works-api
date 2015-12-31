defmodule Mikeworks.V1.TripView do
  use Mikeworks.Web, :view

  def render("index.json", %{trips: trips}) do
    %{data: render_many(trips, Mikeworks.TripView, "trip.json")}
  end

  def render("show.json", %{trip: trip}) do
    %{data: render_one(trip, Mikeworks.TripView, "trip.json")}
  end

  def render("trip.json", %{trip: trip}) do
    %{id: trip.id,
      title: trip.title,
      started_at: trip.started_at,
      ended_at: trip.ended_at,
      location_name: trip.location_name,
      location_lat: trip.location_lat,
      location_lng: trip.location_lng,
      content: trip.content}
  end
end
