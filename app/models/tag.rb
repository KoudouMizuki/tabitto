class Tag < ApplicationRecord

  validates :name, presence: true

  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts, through: :post_tags

end
