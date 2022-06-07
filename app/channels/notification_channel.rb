class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_for "navbar-notification"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
