class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, length: { in: 2..70 }
    #validates :email, email: true #no more validations because of email_validator gem
    validates :address, presence: true
    validates :password, length: { in: 2..20 }
end
