require 'date'

class ChartController < ApplicationController
  def index
    oauth = #get your own damn key!
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
                      :refreshEveryNSeconds => 30,
                      :datapoints => @data
                    },
                  ]
                } 
              }

    render :json => @result
  end

end
