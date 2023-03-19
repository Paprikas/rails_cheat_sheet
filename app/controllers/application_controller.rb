class ApplicationController < ActionController::Base
  def home_page
    render "layouts/home_page"
  end
end
