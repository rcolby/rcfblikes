require 'spec_helper'

describe ChartController do

  describe "#statusboard" do

    describe "index" do
      it "should respond successfuly." do
        get :index
        expect(response).to be_success
        expect(response.status).to eq 200
      end

      it "assigns a data hash."
        get :result
        expect(assigns(:result)).to be_a Hash
    end

  end

  describe "#morris" do
    it "should respond successfully" do
      get :morris
      expect(assigns(:result)).to be_an Array
    end

  end

end