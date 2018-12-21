class Like < ApplicationRecord
  belongs_to :user, inverse_of: :likes
  belongs_to :post, inverse_of: :likes

  validates :user, uniqueness: { scope: :post }
end
