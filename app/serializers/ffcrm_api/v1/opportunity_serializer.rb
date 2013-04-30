module FfcrmApi::V1

  class OpportunitySerializer < ActiveModel::Serializer
    attributes :id, :name, :background_info, :updated_at, :user_id, :contact_ids
  end

end
