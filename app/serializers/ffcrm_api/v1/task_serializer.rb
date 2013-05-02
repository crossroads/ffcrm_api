module FfcrmApi::V1

  class TaskSerializer < ActiveModel::Serializer
    embed :ids, :include => true
    attributes :id, :name, :due_at, :user_id, :assigned_to, :bucket
  end

end
