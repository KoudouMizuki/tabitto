class Post < ApplicationRecord
    
    has_one_attached :post_image
  
  enum parking: { yes:0, no:1, others:2}
  enum season: { spring:0, summer:1, autumm:2, winter:3}
  enum transportation: { car:0, bike:1, bicycle:2, walking:3}
end
