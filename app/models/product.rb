class Product < ApplicationRecord
    validates :name, presence: true
    has_many :orders
    has_many :comments

#def self.search(search_term)
  # like_string = Rails.env.production? ? "ilike" : "LIKE"
  # Product.where("name #{like_string} ?", "%#{search_term}%")
  # end
#end
      validates :name, :price, :image_url, :colour, presence: true



  def self.search(search_term)
    if Rails.env.development?
        Product.where("name LIKE ?", "%#{search_term}%")
      else
        Product.where("name ilike ?", "%#{search_term}%")
      end
  end


  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowerest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def views
    # this is equivalent to "GET product:1"
    $redis.get("product:#{id}")
  end

  def viewed!
    # this is equivalent to "INC product:1"
    $redis.incr("product:#{id}")
  end
end
