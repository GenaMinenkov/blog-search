class Post < ApplicationRecord
  SIMILARITY_INDEX = 0.15

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :tags
  has_many :likes, inverse_of: :post
  belongs_to :category, class_name: 'Tag'

  scope :similar_title, ->(word) { where('similarity(?, title) > ?', word, SIMILARITY_INDEX) }

  class << self
    def available_domains
      Post.pluck(:domain).uniq
    end

    def search(tokens)
      tokens.inject(Post) do |query, token|
        query = query.similar_title(token)
      end
    end
  end
end
