module FfcrmApi::V1

  class AccountSerializer < ActiveModel::Serializer
    embed :ids, :include => true
    attributes :id, :name, :assigned_to, :website, :background_info, :user_id
  end

end
