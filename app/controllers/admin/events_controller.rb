class Admin::EventsController < ApplicationController
  layout 'admin'

  def show
    @calendar = Calendar.find(params[:calendar_id])
    @event = Event.find(params[:id])
  end

  def create
    @calendar = Calendar.find(params[:calendar_id])

    @event = @calendar.events.new(event_params)

    @event.save
    redirect_to admin_calendar_path(@calendar)
  end

  def sort_lower
    @calendar = Calendar.find(params[:calendar_id])
    @event = Event.find(params[:id])

    @event.move_lower

    @event.save

    redirect_to admin_calendar_path(@calendar)
  end

  def sort_higher
    @calendar = Calendar.find(params[:calendar_id])
    @event = Event.find(params[:id])

    @event.move_higher

    @event.save

    redirect_to admin_calendar_path(@calendar)
  end

  def update
    @calendar = Calendar.find(params[:calendar_id])
    @event = Event.find(params[:id])

    @event.update(event_params)

    redirect_to admin_calendar_path(@calendar)
  end

  def destroy
    @calendar = Calendar.find(params[:calendar_id])
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_calendar_path(@calendar)
  end

  private
    def event_params
      params.require(:event).permit(:title, :body, :date_start, :date_end, :position, :calendar_id)
    end
end
