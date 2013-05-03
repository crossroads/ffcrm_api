require 'spec_helper'

feature 'Entities index' do

  let(:entitys_name) { 'accounts' }
  let(:entity_name)  { entitys_name.singularize }

  before do
    @entity1 = FactoryGirl.create(entity_name)
    @entity2 = FactoryGirl.create(entity_name)
    @entity3 = FactoryGirl.create(entity_name)
    @entities = { @entity1.id => @entity1, @entity2.id => @entity2, @entity3.id => @entity3, }
  end

  scenario 'index should return json data' do

    get("api/v1/#{entitys_name}", :format => :json)

    response.response_code.should eql(200)
    data = JSON.parse(response.body)
    data.keys.should include(entitys_name)
    data[entitys_name].size.should == 3
    data[entitys_name].each do |items|
      id = items['id']
      match = @entities[id]
      items['name'].should eql( match.name )
      items['background_info'].should eql( match.background_info )
    end

  end

  scenario 'index should return json data of multiple items' do

    # ids[]=1&ids[]=3
    query = [ @entity1.id, @entity3.id ].map{ |id| "ids[]=#{id}" }.join('&')
    get("api/v1/#{entitys_name}?#{query}", :format => :json)

    response.response_code.should eql(200)
    data = JSON.parse(response.body)
    data.keys.should include(entitys_name)
    ids = data[entitys_name].map{|v| v['id']}
    ids.should include(@entity1.id)
    ids.should include(@entity3.id)
    ids.should_not include(@entity2.id)
  end

  scenario 'show should return json data' do

    get("api/v1/#{entitys_name}/#{@entity1.id}", :format => :json)

    response.response_code.should eql(200)
    data = JSON.parse(response.body)
    data.keys.should include(entity_name)
    data.values.size.should == 1
    item = data[entity_name]
    item['id'].should == @entity1.id
    item['name'].should == @entity1.name
    item['background_info'].should == @entity1.background_info

  end

  scenario 'show should return 404 when not found' do

    get("api/v1/#{entitys_name}/12345", :format => :json)

    response.response_code.should eql(404)
    data = JSON.parse(response.body)
    data[entity_name].should == nil

  end

  scenario 'update should save the model' do

    put("api/v1/#{entitys_name}/#{@entity1.id}", entity_name => {:name => "#{@entity1.name}_changed"}, :format => :json)

    response.response_code.should eql(200)
    data = JSON.parse(response.body)
    item = data[entity_name]
    item['id'].should == @entity1.id
    item['name'].should == "#{@entity1.name}_changed"

  end

  #~ scenario 'failed update should return 422' do
#~
    #~ Account.stub!(:find).and_return(@entity1)
    #~ @entity1.should_receive(:update_attributes).and_return(false)
#~
    #~ put("api/v1/#{entitys_name}/#{@entity1.id}", entity_name => {:name => "#{@entity1.name}_changed"}, :format => :json)
#~
    #~ response.response_code.should eql(422)
    #~ data = JSON.parse(response.body).should be_nil
#~
  #~ end

  scenario 'should delete the entity' do

    lambda { delete("api/v1/#{entitys_name}/#{@entity1.id}", :format => :json) }.should change(Account, :count).by(-1)

  end

end
