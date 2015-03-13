require 'spec_helper'

describe FfcrmApi::V1::OpportunitySerializer do

  let(:entity) { FactoryGirl.build(:opportunity, :account => nil) }
  let(:serializer) { FfcrmApi::V1::OpportunitySerializer.new(entity, {}) }

  subject { serializer.as_json["opportunity"] }

  it "should have attributes" do
    expect(subject[:name]).to eql(entity.name)
    expect(subject[:updated_at]).to eql(entity.updated_at)
    expect(subject[:contact_ids]).to eql(entity.contact_ids)
    expect(subject[:background_info]).to eql(entity.background_info)
    expect(subject[:user_id]).to eql(entity.user_id)
  end

end
