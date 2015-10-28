class PageCountController < ApplicationController
  require "redis"

  def inc_page_count
    render nothing: true
  end
end
