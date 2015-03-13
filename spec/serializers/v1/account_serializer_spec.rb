require 'spec_helper'

describe FfcrmApi::V1::AccountSerializer do

  let(:entity) { FactoryGirl.build(:account) }
  let(:serializer) { FfcrmApi::V1::AccountSerializer.new(entity, {}) }

  subject { serializer.as_json["account"] }

  it "should have attributes" do
    expect(subject[:name]).to eql(entity.name)
    expect(subject[:assigned_to]).to eql(entity.assigned_to)
    expect(subject[:website]).to eql(entity.website)
    expect(subject[:background_info]).to eql(entity.background_info)
    expect(subject[:user_id]).to eql(entity.user_id)
  end

end
