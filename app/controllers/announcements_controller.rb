class AnnouncementsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  
  def index
    @announcements = Announcement.all
    render_to root_path if @announcements.nil?
  end

  def create
    @user = current_user
    @announcement = @user.announcements.new
    if @announcement.update_attributes(announcement_params) && @announcement.save
      flash[:success] = "Announcement published."
      redirect_to announcements_path
    else
      render 'new'
    end
  end

  def new
    @user = current_user
    @announcement = @user.announcements.new
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    flash[:success] = "Announcement deleted."
    redirect_to announcements_path
  end

  def mercury_update
    announcement = Announcement.find(params[:id])
    announcement.content = params[:content][:announcement_content][:value]
    announcement.save
    render text: ""
  end

  private

    def announcement_params
      params.require(:announcement).permit(:content)
    end
end
