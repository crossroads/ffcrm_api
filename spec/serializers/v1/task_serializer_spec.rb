require 'spec_helper'

describe FfcrmApi::V1::TaskSerializer do

  let(:entity) { FactoryGirl.build(:task) }
  let(:serializer) { FfcrmApi::V1::TaskSerializer.new(entity, {}) }

  subject { serializer.as_json["task"] }

  it "should have attributes" do
    expect(subject[:name]).to eql(entity.name)
    expect(subject[:due_at]).to eql(entity.due_at)
    expect(subject[:assigned_to]).to eql(entity.assigned_to)
    expect(subject[:bucket]).to eql(entity.bucket)
    expect(subject[:user_id]).to eql(entity.user_id)
  end

end
