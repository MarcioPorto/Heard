# Sessions Controller
class API::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(phone_number: params[:phone_number])
    if @user
      session[:pre_2fa_auth_user_id] = @user.id

      # Try to verify with OneTouch
      one_touch = Authy::OneTouch.send_approval_request(
        id: @user.authy_id,
        message: 'Request to Login to Twilio demo app',
        details: {
          'Email Address' => @user.email
        }
      )
      status = one_touch['success'] ? :onetouch : :sms
      @user.update(authy_status: status)

      # Respond to the ajax call that requested this with the approval request body
      # render json: { success: one_touch['success'] }
      render :show, status: :created, location: [:api, @user]
    else
      @user ||= User.new(phone_number: params[:phone_number])
      render 'api/v1/errors/error', status: 401
    end
  end

  def destroy
    session[:user_id] = nil
    head :no_content # May want to change this later
  end
end
