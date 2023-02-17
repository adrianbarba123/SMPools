class User < ApplicationRecord::Base
    has_secure_password

    validates :name, presence: true, length: { in: 2..70 }
    validates :email,  presence: true, uniqueness: true
    validates :password, length: { in: 2..20 }
end
