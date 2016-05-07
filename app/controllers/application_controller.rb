class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def iframe_action
    response.headers.delete "X-Frame-Options"
    render_something
  end
end
