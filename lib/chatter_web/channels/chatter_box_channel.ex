defmodule ChatterWeb.ChatterBoxChannel do
  use ChatterWeb, :channel

  # Below is the use for custom authorization topic. For now we will remove any authorization in this chatter box app for the sake of this lesson.

  # def join("chatter_box:lobby", payload, socket) do
  #   if authorized?(payload) do
  #     {:ok, socket}
  #   else
  #     {:error, %{reason: "unauthorized"}}
  #   end
  # end

  def join("chatter_box:lobby", _payload, socket) do
    {:ok, socket}
  end

  # TODO: Find out what this does
  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client

  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chatter_box:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
