class PageViewsController < ApplicationController

  def index
    @page_views = PageView.all
  end
end
