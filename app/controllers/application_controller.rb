class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ::SessionsHelper
  include Mercury::Authentication

  append_before_filter :common_content

  private
  
    def common_content
      # Programmatically generate our nav links using [Link Name, path] pairs
      @navlinks = [{:name => "Home", :path => root_path},
                   {:name => "Events", :path => events_path},
                   {:name => "Code of Ethics", :path => coe_path},
                   {:name => "Announcements", :path => announcements_path},
                   {:name => "Forms", :path => forms_path},
                   {:name => "Results", :path => results_path}]
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end
  
    def verify_user
      @user = User.find(params[:id])
      redirect_to root_path unless @user == current_user
    end
end
