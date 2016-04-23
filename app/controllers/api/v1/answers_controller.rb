# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  content    :text
#  ip_address :string
#  report_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class API::V1::AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy] # :edit
  # load_and_authorize_resource # CanCanCan helper
  respond_to :json

  # GET /answers
  def index
    @answers = Answer.all.sort_by(&:created_at).reverse!
  end

  # GET /answers/1
  def show
  end

  # # GET /answers/new
  # def new
  #   # If the IP address of the current user is in the BlockedAdresses table,
  #   # we don't allow the user to create a new answer
  #   if BlockedAddress.find_by(ip_address: request.remote_ip)
  #     render json: { status: 400, error: 'You are not allowed to create answers anymore.' }.to_json
  #   else
  #     @answer = Answer.new
  #   end
  # end

  # # GET /answers/1/edit
  # def edit
  #   # If the IP address of the current user is in the BlockedAdresses table,
  #   # we don't allow the user to edit an answer
  #   if BlockedAddress.find_by(ip_address: request.remote_ip)
  #     render json: { status: 400, error: 'You are not allowed to edit answers anymore.' }.to_json
  #   end
  # end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)
    # Stores the IP address of the current user to the answer just created
    @answer.ip_address = request.remote_ip
    @answer.save

    if @answer.save
      render :show, status: :created, location: [:api, @answer]
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      render :show, status: :ok, location: [:api, @answer]
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    head :no_content
  end

  private

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.permit(
        :content,
        :report_id
      )
    end
end
