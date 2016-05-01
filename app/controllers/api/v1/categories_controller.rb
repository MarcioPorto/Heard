# Categories Controller
class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  respond_to :json

  # GET /expenditures
  def index
    @categories = Category.all
  end

  # GET /expenditures/1
  def show
  end

  # POST /expenditures
  def create
    @category = Category.new(category_params)

    if @category.save
      render :show, status: :created, location: [:api, @category]
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenditures/1
  def update
    if @category.update(category_params)
      render :show, status: :ok, location: [:api, @category]
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenditures/1
  def destroy
    @category.destroy
    head 204
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def expenditure_params
    params.permit(
      :name
    )
  end
end
