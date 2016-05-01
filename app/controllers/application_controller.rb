class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  # Dependencies:
  include CanCan::ControllerAdditions

  # Rescue from CanCanCan exception
  rescue_from CanCan::AccessDenied do |exception|
    # render json: exception.message, status: 500
    @error_message = exception.message
    render 'api/v1/errors/error', status: 401
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def signed_in?
    current_user.present?
  end
  helper_method :signed_in?

  def block_user_if_needed
    if @report.blocked == false
      diff = @report.votes_for.up - @report.votes_for.down
      if diff > 2
        BlockedPhoneNumber.create(phone_number: current_user.phone_number)
        @report.update(blocked: true)
      end
    end
  end
  helper_method :block_user_if_needed

  protected

  def authenticate!
    # redirect_to new_session_path and return unless signed_in?
    render :json, status: 401 and return unless signed_in?
  end
end
