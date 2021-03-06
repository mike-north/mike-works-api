defmodule Mikeworks.ErrorViewTest do
  use Mikeworks.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render_to_string(Mikeworks.ErrorView, "404.json", []) ==
           "{\"errors\":[\"Page not found\"]}"
  end

  test "render 500.json" do
    assert render_to_string(Mikeworks.ErrorView, "500.json", []) ==
           "{\"errors\":[\"Server internal error\"]}"
  end

  test "render any other" do
    assert render_to_string(Mikeworks.ErrorView, "505.json", []) ==
           "{\"errors\":[\"Server internal error\"]}"
  end
end
