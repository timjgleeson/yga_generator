class AppController < ApplicationController
  def show
    @pages = Page.published
  end
end
