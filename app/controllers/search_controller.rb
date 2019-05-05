class SearchController < ApplicationController
  def index
    @products = if params[:term]
      Product.where('title LIKE ?', "%#{params[:term]}%")
    else
      Product.where('description LIKE ?', "%#{params[:term]}%")
    end

    
  end



  private

    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image, :store_id, :category_id, :brand_id, :user_id)
    end
  
  
end
