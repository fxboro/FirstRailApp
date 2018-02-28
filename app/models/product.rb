class Product < ApplicationRecord

#def self.search(search_term)
  # like_string = Rails.env.production? ? "ilike" : "LIKE"
  # Product.where("name #{like_string} ?", "%#{search_term}%")
  # end
#end


def self.search(search_term)
  Product.where("name LIKE ?", "%#{search_term}%")
end
