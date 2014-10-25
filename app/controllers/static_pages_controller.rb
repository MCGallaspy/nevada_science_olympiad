class StaticPagesController < ApplicationController
  
  def home
    @static_page = StaticPage.find_by name: "Home"
    render template: "static_pages/static_page"
  end

  def code_of_ethics
    @static_page = StaticPage.find_by name: "Code of Ethics"
    render template: "static_pages/static_page"
  end

  def events
    @static_page = StaticPage.find_by name: "Events"
    render template: "static_pages/static_page"
  end

  def mercury_update
    static_page = StaticPage.find(params[:id])
    static_page.content = params[:content][:static_page_content][:value]
    static_page.save
    render text: ""
  end
end
