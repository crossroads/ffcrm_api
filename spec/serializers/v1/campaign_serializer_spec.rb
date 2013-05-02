require 'spec_helper'

describe FfcrmApi::V1::CampaignSerializer do

  let(:entity) { FactoryGirl.build(:campaign) }

  before do
    @serializer = FfcrmApi::V1::CampaignSerializer.new(entity, {})
  end

  %w( id name status starts_on ends_on user_id assigned_to ).each do |attr|
    instance_eval %Q{
      it "should include #{attr}" do
        @serializer.as_json[:campaign][:#{attr}].should == entity.#{attr}
      end
    }, __FILE__, __LINE__ - 4
  end

end
