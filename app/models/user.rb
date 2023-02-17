class User < ApplicationRecord
    has_secure_password

    has_many :pools

    validates :name, presence: true, length: { in: 2..70 }
    validates :password, length: { in: 2..20 }
end
