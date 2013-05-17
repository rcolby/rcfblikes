class Chart
  def initialize

  end

  def fetch_likes
    @graph = Koala::Facebook::API.new(ENV['FB_GRAPH_KEY'])
    @likes = @graph.get_connections("me", "likes")
  end
end
