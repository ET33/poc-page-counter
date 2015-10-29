class PageCountController < ApplicationController
  def inc_page_count
    $redis.zincrby(:page_counter, 1, params[:uri])
    render nothing: true
  end

  # To get top 10 readed: `$redis.zrangebyscore(:page_counter, :'-inf', :'+inf').reverse`
  # optional: `withscore: true`
end
