class Pool < ApplicationRecord
    belongs_to :user
    has_many :pool_services
    has_many :services, through :pool_services
end
