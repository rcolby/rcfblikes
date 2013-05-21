require 'date'

class ChartController < ApplicationController
  def index

  end

  def statusboard
    chart = Chart.new
    @data = chart.get_likes

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

  def morris
    chart = Chart.new
    @data = chart.get_likes

    render :json => @data
  end

  def d3

  end

end
