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

  def create
    @guest = current_user.guests.build(guest_params)
    binding.pry
    if @guest.save
      redirect_to guests_path
    else
      render :new
    end
  end

  def update
    if @guest.update(guest_params)
      redirect_to @guest
    else
      render :edit
    end

  end
  private

  def set_guest
    @guest = Guest.find_by_id(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :street, :state, :city, :zip_code, :event_ids => [])
  end
end