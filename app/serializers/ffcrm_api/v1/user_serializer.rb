module FfcrmApi::V1

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :username, :opportunity_ids
  end

end
