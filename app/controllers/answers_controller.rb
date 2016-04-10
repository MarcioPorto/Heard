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

class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all.sort_by(&:created_at).reverse
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    # If the IP address of the current user is in the BlockedAdresses table,
    # we don't allow the user to create a new answer
    if BlockedAddress.find_by(ip_address: request.remote_ip)
      respond_to do |format|
        format.html { redirect_to reports_path, notice: 'You are not allowed to create answers anymore.' }
        format.json { render json: { status: 400, error: "You are not allowed to create answers anymore." }.to_json }
      end
    else
      @answer = Answer.new
    end
  end

  # GET /answers/1/edit
  def edit
    # If the IP address of the current user is in the BlockedAdresses table,
    # we don't allow the user to edit an answer
    if BlockedAddress.find_by(ip_address: request.remote_ip)
      respond_to do |format|
        format.html { redirect_to reports_path, notice: 'You are not allowed to edit answers anymore.' }
        format.json { render json: { status: 400, error: "You are not allowed to edit answers anymore." }.to_json }
      end
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    # Stores the IP address of the current user to the answer just created
    @answer.ip_address = request.remote_ip
    @answer.save

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.permit(
        :content,
        :report_id
      )
    end
end
