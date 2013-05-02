module FfcrmApi::V1

  class CampaignSerializer < ActiveModel::Serializer
    embed :ids, :include => true
    attributes :id, :name, :status, :starts_on, :ends_on, :user_id, :assigned_to
  end

end
