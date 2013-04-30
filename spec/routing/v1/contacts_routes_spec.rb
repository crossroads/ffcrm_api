require 'spec_helper'

describe FfcrmApi::V1::ContactsController do
  describe "routing" do

    it "generates index route for contacts" do
      expect(:get => "api/v1/contacts/index.json").to route_to(:controller => "ffcrm_api/v1/contacts", :action => 'index', :format => 'json')
    end

    it "generates show route for contact" do
      expect(:get => "api/v1/contacts/1.json").to route_to(:controller => "ffcrm_api/v1/contacts", :action => 'show', :id => '1', :format => 'json')
    end

  end
end
