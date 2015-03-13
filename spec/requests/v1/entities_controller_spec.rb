require 'spec_helper'

feature 'Entities index', type: 'request' do

  let(:user) { FactoryGirl.create(:user) }
  let(:auth_params) { "single_access_token=" + user.single_access_token }
  let(:entitys_name) { 'accounts' }
  let(:entity_name)  { entitys_name.singularize }

  before do
    @entity1 = FactoryGirl.create(entity_name)
    @entity2 = FactoryGirl.create(entity_name)
    @entity3 = FactoryGirl.create(entity_name)
    @entities = { @entity1.id => @entity1, @entity2.id => @entity2, @entity3.id => @entity3, }
  end

  scenario 'index should return json data' do
    get("/api/v1/#{entitys_name}?#{auth_params}", :format => :json)
    response.response_code.should eql(200)
    data = JSON.parse(response.body)
    data.keys.should include(entitys_name)
    data[entitys_name].size.should == 3
    data[entitys_name].each do |items|
      id = items['id']
      match = @entities[id]
      items['name'].should eql( match.name )
      expect(items['background_info']).to eql( match.background_info )
    end
  end

  scenario 'index should return data in descending order of creation' do
    @new_entity = FactoryGirl.create(entity_name, created_at: Time.now)
    get("/api/v1/#{entitys_name}?#{auth_params}", :format => :json)
    expect(JSON.parse(response.body)[entitys_name].first['id'].to_i).to eql(@new_entity.id)
  end

  scenario 'index should allow custom ordering' do
    @new_entity = FactoryGirl.create(entity_name, created_at: Time.now)
    get("/api/v1/#{entitys_name}?order=asc&sort_by=created_at&#{auth_params}", :format => :json)
    expect(JSON.parse(response.body)[entitys_name].last['id'].to_i).to eql(@new_entity.id)
  end

  scenario 'index should return json data of multiple items' do

    # ids[]=1&ids[]=3
    query = [ @entity1.id, @entity3.id ].map{ |id| "ids[]=#{id}" }.join('&')
    get("/api/v1/#{entitys_name}?#{query}&#{auth_params}", :format => :json)

    expect(response.response_code).to eql(200)
    data = JSON.parse(response.body)
    expect(data.keys).to include(entitys_name)
    ids = data[entitys_name].map{|v| v['id']}
    expect(ids).to include(@entity1.id)
    expect(ids).to include(@entity3.id)
    expect(ids).not_to include(@entity2.id)
  end

  scenario 'index should return 400 if invalid params' do
    get("/api/v1/#{entitys_name}?order=blah&sort_by=crazy_date&#{auth_params}", :format => :json)
    expect(response.response_code).to eql(400)
  end

  scenario 'show should return json data' do
    get("/api/v1/#{entitys_name}/#{@entity1.id}?#{auth_params}", :format => :json)
    expect(response.response_code).to eql(200)
    data = JSON.parse(response.body)
    expect(data.keys).to include(entity_name)
    expect(data.values.size).to eql(1)
    item = data[entity_name]
    expect(item['id']).to eql(@entity1.id)
    expect(item['name']).to eql(@entity1.name)
    expect(item['background_info']).to eql(@entity1.background_info)
  end

  scenario 'show should return 404 when not found' do
    get("/api/v1/#{entitys_name}/12345?#{auth_params}", format: :json)
    expect(response.response_code).to eql(404)
    data = JSON.parse(response.body)
    expect(data[entity_name]).to eql(nil)
  end

  scenario 'update should save the model' do
    put("/api/v1/#{entitys_name}/#{@entity1.id}?#{auth_params}", entity_name => {:name => "#{@entity1.name}_changed"}, :format => :json)
    expect(response.response_code).to eql(200)
    data = JSON.parse(response.body)
    item = data[entity_name]
    expect(item['id']).to eql(@entity1.id)
    expect(item['name']).to eql("#{@entity1.name}_changed")
  end

  pending 'failed update should return 422' do
    allow(Account).to receive(:find).and_return(@entity1)
    expect(@entity1).to receive(:update_attributes).and_return(false)
    put("/api/v1/#{entitys_name}/#{@entity1.id}?#{auth_params}", entity_name => {:name => "#{@entity1.name}_changed"}, :format => :json)
    expect(response.response_code).to eql(422)
    expect(JSON.parse(response.body)).to eql(nil)
  end

  scenario 'should delete the entity' do
    expect{ delete("/api/v1/#{entitys_name}/#{@entity1.id}?#{auth_params}", format: :json) }.to change(Account, :count).by(-1)
  end

end
