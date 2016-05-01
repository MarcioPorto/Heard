class BlockedPhoneNumbersController < ApplicationController
  before_action :set_blocked_phone_number, only: [:show, :update, :destroy]

  # GET /blocked_phone_numbers
  # GET /blocked_phone_numbers.json
  def index
    @blocked_phone_numbers = BlockedPhoneNumber.all

    render json: @blocked_phone_numbers
  end

  # GET /blocked_phone_numbers/1
  # GET /blocked_phone_numbers/1.json
  def show
    render json: @blocked_phone_number
  end

  # POST /blocked_phone_numbers
  # POST /blocked_phone_numbers.json
  def create
    @blocked_phone_number = BlockedPhoneNumber.new(blocked_phone_number_params)

    if @blocked_phone_number.save
      render json: @blocked_phone_number, status: :created, location: @blocked_phone_number
    else
      render json: @blocked_phone_number.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blocked_phone_numbers/1
  # PATCH/PUT /blocked_phone_numbers/1.json
  def update
    @blocked_phone_number = BlockedPhoneNumber.find(params[:id])

    if @blocked_phone_number.update(blocked_phone_number_params)
      head :no_content
    else
      render json: @blocked_phone_number.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blocked_phone_numbers/1
  # DELETE /blocked_phone_numbers/1.json
  def destroy
    @blocked_phone_number.destroy

    head :no_content
  end

  private

    def set_blocked_phone_number
      @blocked_phone_number = BlockedPhoneNumber.find(params[:id])
    end

    def blocked_phone_number_params
      params.require(:blocked_phone_number).permit(:phone_number)
    end
end
