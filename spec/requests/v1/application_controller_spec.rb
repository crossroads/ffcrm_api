require 'spec_helper'

feature 'Basic Authentication', type: 'request' do
  let(:user) { FactoryGirl.create(:user) }
  scenario 'should deny access if no token provided' do
    get "/api/v1/campaigns", format: 'json'
    expect(response.response_code).to eql(400)
  end

  scenario 'should allow access if given token' do
    get("/api/v1/campaigns?single_access_token="+user.single_access_token)
    expect(response.response_code).to eql(200)
  end
end
