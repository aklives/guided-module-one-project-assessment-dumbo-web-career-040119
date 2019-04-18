class Author < ActiveRecord::Base

  has_many :posts
  has_many :bands, through: :posts

  def self.most_posts
    arr = []
    authors = Author.select(:name).uniq
    authors.each do |author|
      arr << author.posts.count
    end
    binding.pry
  end

  # def self.most_posts
  #   authors = Author.select(:name).map(&:name).uniq
  #   authors.each do |author|
  #
  #     author_object = Author.find_by(name: author)
  #     most_posts = author_object.posts.count
  #   end
  # end


end
