class Author < ActiveRecord::Base

  has_many :posts
  has_many :bands, through: :posts

end
