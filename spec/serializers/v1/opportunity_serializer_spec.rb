require 'spec_helper'

describe FfcrmApi::V1::OpportunitySerializer do

  let(:entity) { FactoryGirl.build(:opportunity, :account => nil) }

  before do
    @serializer = FfcrmApi::V1::OpportunitySerializer.new(entity, {})
  end

  %w( id name background_info updated_at user_id contact_ids ).each do |attr|
    instance_eval %Q{
      it "should include #{attr}" do
        @serializer.as_json[:opportunity][:#{attr}].should == entity.#{attr}
      end
    }, __FILE__, __LINE__ - 4
  end

end
