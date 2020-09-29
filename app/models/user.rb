class User < ApplicationRecord
    has_many :favorites
    has_many :strocks, through: :favorites

    has_secure_password

end