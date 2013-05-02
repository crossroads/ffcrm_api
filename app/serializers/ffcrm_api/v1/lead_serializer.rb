module FfcrmApi::V1

  class LeadSerializer < ActiveModel::Serializer
    embed :ids, :include => true
    attributes :id, :first_name, :last_name, :user_id, :assigned_to, :background_info
  end

end
