class PoolServiceSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :pools
  has_one :services
end
