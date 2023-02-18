class Pool < ApplicationRecord
    belongs_to :user
    has_many :pool_services, dependent: :destroy
    has_many :services, through: :pool_services
end
