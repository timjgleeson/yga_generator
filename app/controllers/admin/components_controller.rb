class Admin::ComponentsController < ApplicationController
  def create
    @page = Page.find(params[:page_id])

    @component = @page.components.new(component_params)

    @component.save
    redirect_to admin_page_path(@page)
  end

  def sort_lower
    @page = Page.find(params[:page_id])
    @component = Component.find(params[:id])

    @component.move_lower

    @component.save

    redirect_to admin_page_path(@page)
  end

  def sort_higher
    @page = Page.find(params[:page_id])
    @component = Component.find(params[:id])

    @component.move_higher

    @component.save

    redirect_to admin_page_path(@page)
  end

  def destroy
    @page = Page.find(params[:page_id])
    @component = Component.find(params[:id])
    @component.destroy
    redirect_to admin_page_path(@page)
  end

  private
    def component_params
      params.require(:component).permit(:title, :type, :calendar_id, :body, :embed_url, :position)
    end
end
