require 'spec_helper'

describe FfcrmApi::V1::ContactsController do
  describe "routing" do

    let(:entities) { %w(accounts contacts campaigns opportunities leads tasks users) }

    it "index" do
      entities.each do |entity|
        expect(:get => "api/v1/#{entity}").to route_to(:controller => "ffcrm_api/v1/#{entity}", :action => 'index', :format => 'json')
      end
    end

    it "show" do
      entities.each do |entity|
        expect(:get => "api/v1/#{entity}/1.json").to route_to(:controller => "ffcrm_api/v1/#{entity}", :action => 'show', :id => '1', :format => 'json')
      end
    end

    it "update" do
      entities.each do |entity|
        expect(:put => "api/v1/#{entity}/1.json").to route_to(:controller => "ffcrm_api/v1/#{entity}", :action => 'update', :id => '1', :format => 'json')
      end
    end

    it "destroy" do
      entities.each do |entity|
        expect(:delete => "api/v1/#{entity}/1.json").to route_to(:controller => "ffcrm_api/v1/#{entity}", :action => 'destroy', :id => '1', :format => 'json')
      end
    end

  end
end
