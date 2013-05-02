class FfcrmApi::V1::EntitiesController < FfcrmApi::ApplicationController

  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  # TODO paging and custom ordering support required
  def index
    entities = klass.order(:created_at)
    render :json => entities, :each_serializer => serializer
  end

  def show
    entity = klass.find(params[:id])
    render :json => entity, :serializer => serializer
  end

  protected

  # e.g. opportunity
  def entity_name
    controller_name.singularize
  end

  # e.g. Opportunity
  def klass
    entity_name.classify.constantize
  end

  # e.g. FfcrmApi::V1::ContactSerializer
  def serializer
    "FfcrmApi::V1::#{entity_name.classify}Serializer".constantize
  end

  def not_found
    render :json => {}, :status => :not_found
  end

end
