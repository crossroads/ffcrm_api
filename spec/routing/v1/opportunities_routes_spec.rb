require 'spec_helper'

describe FfcrmApi::V1::OpportunitiesController do
  describe "routing" do

    it "generates index route for opportunities" do
      expect(:get => "api/v1/opportunities/index.json").to route_to(:controller => "ffcrm_api/v1/opportunities", :action => 'index', :format => 'json')
    end

    it "generates show route for opportunity" do
      expect(:get => "api/v1/opportunities/1.json").to route_to(:controller => "ffcrm_api/v1/opportunities", :action => 'show', :id => '1', :format => 'json')
    end

  end
end
