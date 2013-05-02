require 'spec_helper'

describe FfcrmApi::V1::EntitiesController do

  before do
    controller.stub!(:controller_name).and_return('accounts')
  end

  it 'entity_name' do
    controller.send(:entity_name).should == "account"
  end

  it 'klass' do
    controller.send(:klass).to_s.should == "Account"
  end

  it 'serializer' do
    controller.send(:serializer).to_s.should == "FfcrmApi::V1::AccountSerializer"
  end

end
