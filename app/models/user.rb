class User < ApplicationRecord
    has_many :favorites
    has_many :stocks, through: :favorites

    has_secure_password

end
