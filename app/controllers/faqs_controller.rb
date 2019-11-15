class FaqsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: :index
  before_action :set_faq, only: [:edit, :destroy, :update]
  before_action :set_event

  def new
    @faq = @event.faqs.build
  end

  def create
    @faq = @event.faqs.build(faq_params)
    @faq.user = current_user

    if @faq.save
      redirect_to event_faqs_path
    else
      render :new
    end
  end

  def index
    @faqs = @event.faqs
    render 'index', layout: 'special'
  end

  def edit
  end

  def update
    if @faq.update(faq_params)
      redirect_to events_path
    else
      render :edit
    end

  end

  def destroy
    @faq.destroy
    redirect_to events_path(@event)
  end

  private

  def set_faq
    @faq = Faq.find_by_id(params[:id])
  end

  def set_event
    @event = Event.find_by_id(params[:event_id])
  end

  def faq_params
    params.require(:faq).permit(:question, :answer, :event_id)
  end
end
