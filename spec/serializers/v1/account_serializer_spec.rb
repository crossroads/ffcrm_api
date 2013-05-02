require 'spec_helper'

describe FfcrmApi::V1::AccountSerializer do

  let(:entity) { FactoryGirl.build(:account) }

  before do
    @serializer = FfcrmApi::V1::AccountSerializer.new(entity, {})
  end

  %w( id name assigned_to website background_info user_id ).each do |attr|
    instance_eval %Q{
      it "should include #{attr}" do
        @serializer.as_json[:account][:#{attr}].should == entity.#{attr}
      end
    }, __FILE__, __LINE__ - 4
  end

end
