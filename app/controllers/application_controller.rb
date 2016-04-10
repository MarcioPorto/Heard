class ApplicationController < ActionController::Base
  # This is the line that makes it work. Don't remove it!!!!!!!!!!
  include ActionController::MimeResponds

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
end
