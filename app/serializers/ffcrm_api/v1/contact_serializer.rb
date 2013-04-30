module FfcrmApi::V1

  class ContactSerializer < ActiveModel::Serializer
    embed :ids, :include => true
    attributes :id, :first_name, :last_name, :user_id, :opportunity_ids
    #~ has_many :opportunities
  end

end
