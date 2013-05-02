require 'spec_helper'

describe FfcrmApi::V1::UserSerializer do

  let(:entity) { FactoryGirl.build(:user) }

  before do
    @serializer = FfcrmApi::V1::UserSerializer.new(entity, {})
  end

  %w( id first_name last_name email username opportunity_ids ).each do |attr|
    instance_eval %Q{
      it "should include #{attr}" do
        @serializer.as_json[:user][:#{attr}].should == entity.#{attr}
      end
    }, __FILE__, __LINE__ - 4
  end

end
