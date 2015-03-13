require 'spec_helper'

describe FfcrmApi::V1::UserSerializer do

  let(:entity) { FactoryGirl.build(:user) }
  let(:serializer) { FfcrmApi::V1::UserSerializer.new(entity, {}) }

  subject { serializer.as_json["user"] }

  it "should have attributes" do
    expect(subject[:first_name]).to eql(entity.first_name)
    expect(subject[:last_name]).to eql(entity.last_name)
    expect(subject[:email]).to eql(entity.email)
    expect(subject[:username]).to eql(entity.username)
    expect(subject[:opportunity_ids]).to eql(entity.opportunity_ids)
  end

end
