class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
    render_to root_path if @announcements.nil?
  end
end
