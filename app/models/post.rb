class Post < ApplicationRecord

  enum parking: { yes_parking:0, not_parking:1}
  enum season: { spring:0, summer:1, autumm:2, winter:3}
  enum transportation: {car:0, bike:1, bicycle:2, walking:3}

  has_one_attached :post_image
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  def save_tags(tags)
    tag_list = tags.split(/[[:blank:]]+/)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/asets/images/no-image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorite?(user)
   favorites.where(user_id: user.id).exists?
  end




end