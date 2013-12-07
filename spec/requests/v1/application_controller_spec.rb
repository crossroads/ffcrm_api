require_relative '../../spec_helper'

feature 'Basic Authentication' do
  let(:user) { FactoryGirl.create(:user) }
  scenario 'should deny access if no token provided' do
    get("api/v1/campaigns", :format => :json)
    response.response_code.should eql(400)
  end

  scenario 'should allow access if given token' do
    get("api/v1/campaigns?single_access_token="+user.single_access_token)
    response.response_code.should eql(200)
  end
end
