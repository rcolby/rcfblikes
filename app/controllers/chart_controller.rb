require 'date'

class ChartController < ApplicationController
  def index
    oauth = "CAACEdEose0cBAAS3FPrjwHjDTaZC3kXR84ZBl4mJHfGS6OvjXsY6yXaNvItZBd8T1WKl5ZCcQ6QJVCB16b38lalmai8rDntWNHPwh1cclhaxadtEvXkZAzbUOg1NWKvrIKdMoNRh6hBZBElOVG4CJWrPopDQtq33Pi59aZAEN4qQwZDZD"
    @graph = Koala::Facebook::API.new(oauth)
    @likes = @graph.get_connections("me", "likes")
    @data = {}

    @data = @likes.group_by do |l|
      Date.strptime(l['created_time']).strftime("%Y-%m")
    end

    @data.each do |year_month, group|
      @data[year_month] = group.size
    end

    (2009..2012).each do |year|
      (1..12).each do |month|
        if month < 10
          month = "#{0}#{month}"
        end
        @data["#{year}-#{month}"] ||= 0
      end
    end

    @data = @data.sort

    @data.map! do |a|
      {:title => a[0], :value => a[1]}
    end

    @result = {
                :graph => {
                  :title => "Facebook Likes Over Time",
                  :datasequences => [
                    {
                      :title => "#likes/month",
                      :datapoints => @data
                    },
                  ]
                } 
              }

    render :json => @result
  end

end
