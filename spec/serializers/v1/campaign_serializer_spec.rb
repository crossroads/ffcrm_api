require 'spec_helper'

describe FfcrmApi::V1::CampaignSerializer do

  let(:entity) { FactoryGirl.build(:campaign) }
  let(:serializer) { FfcrmApi::V1::CampaignSerializer.new(entity, {}) }

  subject { serializer.as_json["campaign"] }

  it "should have attributes" do
    expect(subject[:name]).to eql(entity.name)
    expect(subject[:assigned_to]).to eql(entity.assigned_to)
    expect(subject[:status]).to eql(entity.status)
    expect(subject[:starts_on]).to eql(entity.starts_on)
    expect(subject[:ends_on]).to eql(entity.ends_on)
    expect(subject[:user_id]).to eql(entity.user_id)
  end

end
