require 'spec_helper'

describe Chart do
    it "fetches likes." do
    chart = Chart.new
    likes = chart.fetch_likes
  end
end