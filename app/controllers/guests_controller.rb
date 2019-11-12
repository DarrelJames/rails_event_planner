class GuestsController < ApplicationController
  load_and_authorize_resource
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def new
    @guest = Guest.new
  end

  def edit
  end

  def show

  end

  def index
    @guests = current_user.guests
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
      redirect_to guests_path
    else
      render :edit
    end

  end

  def destroy
    @guest.destroy
    redirect_to guests_path
  end
  private

  def set_guest
    @guest = Guest.find_by_id(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :street, :state, :city, :zip_code, :event_ids => [])
  end
end
