class DashboardsController < ApplicationController
  def show
    @text_subject = TextSubject.new
    @shout_feed = current_user.timeline
    @image_subject = ImageSubject.new

  end
end
