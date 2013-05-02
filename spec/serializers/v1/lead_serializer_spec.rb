require 'spec_helper'

describe FfcrmApi::V1::LeadSerializer do

  let(:entity) { FactoryGirl.build(:lead) }

  before do
    @serializer = FfcrmApi::V1::LeadSerializer.new(entity, {})
  end

  %w( id first_name last_name user_id assigned_to background_info ).each do |attr|
    instance_eval %Q{
      it "should include #{attr}" do
        @serializer.as_json[:lead][:#{attr}].should == entity.#{attr}
      end
    }, __FILE__, __LINE__ - 4
  end

end
