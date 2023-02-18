class Service < ApplicationRecord
    has_many :pool_services, dependent: :destroy
    has_many :pools, through: :pool_services
end
