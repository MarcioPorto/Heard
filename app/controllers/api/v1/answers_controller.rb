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
  before_filter :authenticate!
  before_action :set_answer, only: [:show, :update, :destroy] # :edit
  load_and_authorize_resource # CanCanCan helper
  respond_to :json

  # GET /answers
  def index
    @answers = Answer.all.sort_by(&:created_at).reverse!
  end

  # GET /answers/1
  def show
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
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
