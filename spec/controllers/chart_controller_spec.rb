require 'spec_helper'

describe ChartController do

  describe "index" do
    it "should successfully respond with a 200 HTTP object when making an HTML request." do
      get :index
      expect(response).to be_success
      expect(response.status).to eq 200
    end

  end
end