class FaqsController < ApplicationController
  before_action [:set_faq, :set_event], only: [:edit, :update, :destroy, :index]

  def new
  end

  def create
    raise params.inspect
  end

  def index
    @faqs = @event.faqs
  end

  def edit
  end

  def update
  end

  def destroy
    # code
  end

  private

  def set_faq
    @faq = Faq.find_by_id(params[:id])
  end

  def set_event
    @event = Event.find_by_id(params[:event_id])
  end

  def faq_params
    params.require(:faq).permit(:question, :answer)
  end
end
