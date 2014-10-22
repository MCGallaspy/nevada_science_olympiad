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
                   {:name => "Code of Ethics", :path => coe_path}]
    end
end
