require 'spec_helper'

feature 'Entities index' do

  let(:entitys) { 'accounts' }
  let(:entity)  { entitys.singularize }
  let(:entity1) { FactoryGirl.create(entity) }
  let(:entity2) { FactoryGirl.create(entity) }

  scenario 'index should return json data' do

    get("api/v1/#{entitys}", :format => :json)

    response.response_code.should eql(200)
    data = JSON.parse(response.body)
    data.keys.should == [entitys]
    data[entitys].each do |items|
      id = items['id']
      items['name'].should eql( send("entity#{id}").name )
      items['background_info'].should eql( send("entity#{id}").background_info )
    end

  end

  scenario 'show should return json data' do

    get("api/v1/#{entitys}/#{entity1.id}", :format => :json)

    response.response_code.should eql(200)
    data = JSON.parse(response.body)
    data.keys.should == [entity]
    data.values.size.should == 1
    item = data[entity]
    item['id'].should == entity1.id
    item['name'].should == entity1.name
    item['background_info'].should == entity1.background_info

  end

  scenario 'show should return 404 when not found' do

    get("api/v1/#{entitys}/12345", :format => :json)

    response.response_code.should eql(404)
    data = JSON.parse(response.body)
    data[entity].should == nil

  end

end
