class BlockedAddressesController < ApplicationController
  before_action :set_blocked_address, only: [:show, :edit, :update, :destroy]

  # GET /blocked_addresses
  # GET /blocked_addresses.json
  def index
    @blocked_addresses = BlockedAddress.all
  end

  # GET /blocked_addresses/1
  # GET /blocked_addresses/1.json
  def show
  end

  # GET /blocked_addresses/new
  def new
    @blocked_address = BlockedAddress.new
  end

  # GET /blocked_addresses/1/edit
  def edit
  end

  # POST /blocked_addresses
  # POST /blocked_addresses.json
  def create
    @blocked_address = BlockedAddress.new(blocked_address_params)

    respond_to do |format|
      if @blocked_address.save
        format.html { redirect_to @blocked_address, notice: 'Blocked address was successfully created.' }
        format.json { render :show, status: :created, location: @blocked_address }
      else
        format.html { render :new }
        format.json { render json: @blocked_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blocked_addresses/1
  # PATCH/PUT /blocked_addresses/1.json
  def update
    respond_to do |format|
      if @blocked_address.update(blocked_address_params)
        format.html { redirect_to @blocked_address, notice: 'Blocked address was successfully updated.' }
        format.json { render :show, status: :ok, location: @blocked_address }
      else
        format.html { render :edit }
        format.json { render json: @blocked_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocked_addresses/1
  # DELETE /blocked_addresses/1.json
  def destroy
    @blocked_address.destroy
    respond_to do |format|
      format.html { redirect_to blocked_addresses_url, notice: 'Blocked address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blocked_address
      @blocked_address = BlockedAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blocked_address_params
      params.require(:blocked_address).permit(:ip_address)
    end
end
