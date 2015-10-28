class PageCountController < ApplicationController
  def inc_page_count
    render nothing: true
    # TODO gonna use redis here?
  end
end
