class User < ApplicationRecord
  has_many :likes, inverse_of: :user
end
