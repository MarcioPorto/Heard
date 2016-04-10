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

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.where(blocked: false).sort_by(&:created_at).reverse
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @category = Category.find_by(id: @report.category_id)
    @answers = @report.answers
  end

  # GET /reports/new
  def new
    # If the IP address of the current user is in the BlockedAdresses table,
    # we don't allow the user to create a new report
    if BlockedAddress.find_by(ip_address: request.remote_ip)
      respond_to do |format|
        format.html { redirect_to reports_path, notice: 'You are not allowed to create Reports anymore.' }
        format.json { render json: { status: 400, error: "You are not allowed to edit reports anymore." }.to_json }
      end
    else
      @report = Report.new
      @categories = Category.all
    end
  end

  # GET /reports/1/edit
  def edit
    # If the IP address of the current user is in the BlockedAdresses table,
    # we don't allow the user to edit a report
    if BlockedAddress.find_by(ip_address: request.remote_ip)
      respond_to do |format|
        format.html { redirect_to reports_path, notice: 'You are not allowed to edit Reports anymore.' }
        format.json { render json: { status: 400, error: "You are not allowed to edit reports anymore." }.to_json }
      end
    else
      @categories = Category.all
    end
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    # Stores the IP address of the current user to the report just created
    @report.ip_address = request.remote_ip
    @report.save

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    # The following adds a user's IP address to the BlockedAdresses database
    # if a report posted by that user has been 'downvoted' 3 times
    if @report.blocked == false
      if @report.block_votes > 2
        BlockedAddress.create(ip_address: @report.ip_address)
        @report.blocked = true
        @report.save
      end
    end

    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
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
