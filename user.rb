# building user model, user has 1:m relationship with job application
class User < ApplicationRecord
    #ENCRYPT PASSWORD
    has_secure_password
    has_many :applications, dependent: :destroy, foreign_key: :id
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
end
