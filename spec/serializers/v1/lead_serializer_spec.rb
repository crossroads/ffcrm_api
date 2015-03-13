require 'spec_helper'

describe FfcrmApi::V1::LeadSerializer do

  let(:entity) { FactoryGirl.build(:lead) }
  let(:serializer) { FfcrmApi::V1::LeadSerializer.new(entity, {}) }

  subject { serializer.as_json["lead"] }

  it "should have attributes" do
    expect(subject[:first_name]).to eql(entity.first_name)
    expect(subject[:last_name]).to eql(entity.last_name)
    expect(subject[:assigned_to]).to eql(entity.assigned_to)
    expect(subject[:background_info]).to eql(entity.background_info)
    expect(subject[:user_id]).to eql(entity.user_id)
  end

end
