class Admin::PagesController < ApplicationController
  layout 'admin'

  def index
    @pages = Page.order(:position)
  end

  def show
    @page = Page.find(params[:id])
  end

  def new

  end

  def create
    @page = Page.new(page_params)

    @page.save
    redirect_to admin_page_path(@page)
  end

  def publish
    @page = Page.find(params[:id])

    @page.is_published = true

    @page.save

    redirect_to admin_page_path(@page)
  end

  def unpublish
    @page = Page.find(params[:id])

    @page.is_published = false

    @page.save

    redirect_to admin_page_path(@page)
  end

  def sort_lower
    @page = Page.find(params[:id])

    @page.move_lower

    @page.save

    redirect_to admin_pages_path
  end

  def sort_higher
    @page = Page.find(params[:id])

    @page.move_higher

    @page.save

    redirect_to admin_pages_path
  end

  def update
    @page = Page.find(params[:id])

    @page.update(page_params)

    redirect_to admin_page_path(@page)
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_pages_path
  end

  private
    def page_params
      params.require(:page).permit(:title, :slug, :position, :is_published)
    end
end
