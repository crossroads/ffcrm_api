require 'spec_helper'

describe FfcrmApi::V1::EntitiesController, type: 'controller' do

  before do
    allow(controller).to receive(:controller_name).and_return('accounts')
  end

  it 'entity_name' do
    expect(controller.send(:entity_name)).to eql("account")
  end

  it 'klass' do
    expect(controller.send(:klass).to_s).to eql("Account")
  end

  it 'serializer' do
    expect(controller.send(:serializer).to_s).to eql("FfcrmApi::V1::AccountSerializer")
  end

end
