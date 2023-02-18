class PoolServiceSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :pool
  has_one :service
end
