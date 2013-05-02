require 'spec_helper'

describe FfcrmApi::V1::ContactSerializer do

  let(:entity) { FactoryGirl.build(:contact) }

  before do
    @serializer = FfcrmApi::V1::ContactSerializer.new(entity, {})
  end

  %w( id first_name last_name user_id opportunity_ids ).each do |attr|
    instance_eval %Q{
      it "should include #{attr}" do
        @serializer.as_json[:contact][:#{attr}].should == entity.#{attr}
      end
    }, __FILE__, __LINE__ - 4
  end

end
