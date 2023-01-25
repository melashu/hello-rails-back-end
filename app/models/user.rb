class User < ApplicationRecord
  has_many :greetings, dependent: :destroy
  has_secure_password
end
