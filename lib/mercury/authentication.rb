module Mercury
  module Authentication
    include ::SessionsHelper
    
    def can_edit?
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_path
      else
        true
      end
    end
  end
end
