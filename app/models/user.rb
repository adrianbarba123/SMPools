class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, length: { in: 2..70 }
    validates :password, length: { in: 2..20 }
end
