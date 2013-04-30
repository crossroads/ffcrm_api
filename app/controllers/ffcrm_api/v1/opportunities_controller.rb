module FfcrmApi::V1
  class OpportunitiesController < FfcrmApi::ApplicationController

    respond_to :json

    # TODO paging and ordering support required
    def index
      @opportunities = Opportunity.order(:created_at)
      render :json => @opportunities, :each_serializer => FfcrmApi::V1::OpportunitySerializer
    end

    def show
      @opportunity = Opportunity.where(:id => params[:id])
      render :json => @opportunity, :serializer => FfcrmApi::V1::OpportunitySerializer
    end

  end
end
