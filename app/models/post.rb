class Post < ApplicationRecord
  
  enum parking: { yes:0, no:1, others:2}
end
