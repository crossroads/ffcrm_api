module FfcrmApi::V1
  class ContactsController < FfcrmApi::ApplicationController

    respond_to :json

    # TODO paging and ordering support required
    def index
      @contacts = Contact.order(:created_at)
      render :json => @contacts, :each_serializer => FfcrmApi::V1::ContactSerializer
    end

    def show
      @contact = Contact.where(:id => params[:id])
      render :json => @contact, :serializer => FfcrmApi::V1::ContactSerializer
    end

  end
end
