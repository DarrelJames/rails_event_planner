class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  def new
    @guest = Guest.new
  end

  def edit
  end

  def show
  end

  def index
    @guests = Guest.all
  end

  private

  def set_guest
    @guest = Guest.find_by_id(params[:idea])
  end

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :street, :state, :city, :zip_code)
  end
end
