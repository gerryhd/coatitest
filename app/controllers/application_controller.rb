class ApplicationController < ActionController::Base
  def index
    if user_signed_in?
      redirect_to projects_path
    else
      render html: "WELCOME PLEASE LOGIN"
    end
  end
end
