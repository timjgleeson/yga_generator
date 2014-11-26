class App::PagesController < ApplicationController
  def show

    @page = Page.find_by! :slug => params[:slug]

    @components = @page.components.order(:position)

    if params[:event_id].nil?
      @event = nil
    else
      @event = Event.find(params[:event_id])
    end
  end
end
