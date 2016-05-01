# Users Controller
class API::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.email = @user.phone_number + '@heard.com'
    @user.password_digest = '12345678'
    @user.save
    if @user.save
      session[:user_id] = @user.id

      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone_number,
        country_code: @user.country_code
      )
      @user.update(authy_id: authy.id)

      # redirect_to account_path
      render :show, status: :created, location: [:api, @user]
    else
      # render :new
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(
      :country_code,
      :phone_number
    )
  end
end
