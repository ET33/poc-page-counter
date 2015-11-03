class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_most_read_news

  def set_most_read_news
    @most_read_news = ::MostReadNews.new.fetch
  end
end
