require 'spec_helper'

describe FfcrmApi::V1::TaskSerializer do

  let(:entity) { FactoryGirl.build(:task) }

  before do
    @serializer = FfcrmApi::V1::TaskSerializer.new(entity, {})
  end

  %w( id name due_at user_id assigned_to bucket ).each do |attr|
    instance_eval %Q{
      it "should include #{attr}" do
        @serializer.as_json[:task][:#{attr}].should == entity.#{attr}
      end
    }, __FILE__, __LINE__ - 4
  end

end
