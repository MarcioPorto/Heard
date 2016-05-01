# == Schema Information
#
# Table name: reports
#
#  id          :integer          not null, primary key
#  address     :string
#  latitude    :float
#  longitude   :float
#  called_911  :boolean          default(FALSE)
#  description :string
#  ip_address  :string           default("")
#  blocked     :boolean          default(FALSE)
#  block_votes :integer          default(0)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class API::V1::ReportsController < ApplicationController
  before_filter :authenticate!
  before_action :set_report, only: [:show, :update, :destroy, :upvote, :downvote] # :edit
  load_and_authorize_resource # CanCanCan helper
  respond_to :json

  # GET /reports
  def index
    @reports = Report.where(blocked: false).sort_by(&:created_at).reverse!
  end

  # GET /reports/1
  def show
    @category = Category.find_by(id: @report.category_id)
    @answers = @report.answers
  end

  # # GET /reports/new
  # def new
  #   if BlockedPhoneNumber.find_by(phone_number: current_user.phone_number)
  #     render json: { status: 400, error: 'You are not allowed to edit reports anymore.' }.to_json
  #   else
  #     @report = Report.new
  #     @categories = Category.all
  #   end
  # end

  # # GET /reports/1/edit
  # def edit
  #   if BlockedPhoneNumber.find_by(phone_number: current_user.phone_number)
  #     render json: { status: 400, error: 'You are not allowed to edit reports anymore.' }.to_json
  #   else
  #     @categories = Category.all
  #   end
  # end

  # POST /reports
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.save

    if @report.save
      render :show, status: :created, location: [:api, @report]
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    block_user_if_needed

    if @report.update(report_params)
      render :show, status: :ok, location: [:api, @report]
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    head :no_content
  end

  # VOTING
  # Send id as param
  def upvote
    @report.upvote_from current_user
    render :show, status: :ok, location: [:api, @report]
  end

  def downvote
    @report.downvote_from current_user
    render :show, status: :ok, location: [:api, @report]
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.permit(
      :address,
      :latitude,
      :longitude,
      :called_911,
      :description,
      :category_id,
      :blocked,
      :block_votes
    )
  end
end
