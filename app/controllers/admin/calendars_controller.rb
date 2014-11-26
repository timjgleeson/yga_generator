class Admin::CalendarsController < ApplicationController
  layout 'admin'

  def index
    @calendars = Calendar.all
  end

  def show
    @calendar = Calendar.find(params[:id])
    @events = @calendar.events.order(:position)
  end

  def create
    @calendar = Calendar.new(calendar_params)

    @calendar.save
    redirect_to admin_calendar_path(@calendar)
  end

  def update
    @calendar = Calendar.find(params[:id])

    @calendar.update(calendar_params)

    redirect_to admin_calendar_path(@calendar)
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to admin_calendars_path
  end

  private
    def calendar_params
      params.require(:calendar).permit(:title)
    end
end
