require 'spec_helper'

describe FfcrmApi::V1::ContactSerializer do

  let(:entity) { FactoryGirl.build(:contact) }
  let(:serializer) { FfcrmApi::V1::ContactSerializer.new(entity, {}) }

  subject { serializer.as_json["contact"] }

  it "should have attributes" do
    expect(subject[:first_name]).to eql(entity.first_name)
    expect(subject[:last_name]).to eql(entity.last_name)
    expect(subject[:opportunity_ids]).to eql(entity.opportunity_ids)
    expect(subject[:user_id]).to eql(entity.user_id)
  end

end
