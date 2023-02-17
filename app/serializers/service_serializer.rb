class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :cleaning, :chemical_balance, :quote
end
