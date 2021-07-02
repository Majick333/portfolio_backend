class ContactRequestsController < ApplicationController
  before_action :set_contact_request, only: [:show, :update, :destroy]

  # GET /contact_requests
  def index
    @contact_requests = ContactRequest.all

    render json: @contact_requests
  end

  # GET /contact_requests/1
  def show
    render json: @contact_request
  end

  # POST /contact_requests
  def create
    @contact_request = ContactRequest.new(contact_request_params)

    if @contact_request.save
      render json: @contact_request, status: :created, location: @contact_request
    else
      render json: @contact_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contact_requests/1
  def update
    if @contact_request.update(contact_request_params)
      render json: @contact_request
    else
      render json: @contact_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contact_requests/1
  def destroy
    @contact_request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_request
      @contact_request = ContactRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_request_params
      params.require(:contact_request).permit(:name, :message, :email, :phone)
    end
end
