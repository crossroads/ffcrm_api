class FfcrmApi::V1::EntitiesController < FfcrmApi::ApplicationController
  before_filter :require_login

  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  # TODO paging
  def index
    if params[:sort_by] or params[:order]
      if klass.column_names.include?(params[:sort_by]) and %w(asc desc).include?(params[:order])
        sort_by = params[:sort_by]
        order = params[:order]
      else
        return head 400
      end
    else
      sort_by = "created_at"
      order = "desc"
    end
    entities = klass.order("#{sort_by} #{order}")
    entities = entities.where(:id => params[:ids]) unless params[:ids].nil?
    render :json => entities, :each_serializer => serializer
  end

  def show
    render :json => entity, :serializer => serializer
  end

  def update
    entity.update_attributes( params[entity_name], :without_protection => true ) # TODO whitelisting
    render :json => entity, :serializer => serializer
  end

  def destroy
    entity.destroy
    render :json => {}
  end

  protected

  def entity
    @entity ||= klass.find(params[:id])
  end

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
