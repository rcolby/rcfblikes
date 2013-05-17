require 'date'

class ChartController < ApplicationController
  def index
    oauth = "CAACEdEose0cBAAS3FPrjwHjDTaZC3kXR84ZBl4mJHfGS6OvjXsY6yXaNvItZBd8T1WKl5ZCcQ6QJVCB16b38lalmai8rDntWNHPwh1cclhaxadtEvXkZAzbUOg1NWKvrIKdMoNRh6hBZBElOVG4CJWrPopDQtq33Pi59aZAEN4qQwZDZD"
    @graph = Koala::Facebook::API.new(oauth)
    @likes = @graph.get_connections("me", "likes")
    @data = {}

    @likes.each do |like|
      date = @data[Date.strptime(like["created_time"]).strftime("%Y-%m")]
      if @data.has_key?(date)
        @data[date] += 1
      else
        @data[date] = 1
      end

    end

    render :json => @data
  end

end
