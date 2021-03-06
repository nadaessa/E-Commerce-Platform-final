class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :image 
  has_many :reviews

  def self.search(term, search_term)
    if term
      if search_term == "0"
        where('title LIKE ?', "%#{term}%")
      elsif search_term == "1"
        where('description LIKE ?', "%#{term}%")
      end
    else
      all
    end
  end

  def self.filter(category_id, brand_id, seller_id)
    if category_id
      where('category_id LIKE ?', "%#{category_id}%")
    elsif brand_id
      where('brand_id LIKE ?', "%#{brand_id}%")
    elsif seller_id
      where('seller_id LIKE ?', "%#{seller_id}%")
    else
      all
    end
  end

end
