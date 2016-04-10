class ApplicationController < ActionController::Base
  # This allows us to use respond_to in API mode
  include ActionController::MimeResponds
end
