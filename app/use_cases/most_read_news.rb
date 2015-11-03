class MostReadNews
  def pageview_repository
    @pageview_repository ||= PageViewRepository.new
  end

  def fetch
    ids = PageViewRepository.new.most_read_ids
    ids.any? ? News.where(id: ids).order("field(id, #{ids.join(",")})") : []
  end
end

