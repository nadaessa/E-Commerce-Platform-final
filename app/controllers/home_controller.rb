class HomeController < ApplicationController
    #def index
     #   @products=Product.all
    #end


    def index
      @products = if params[:term]
        if params[:search_term] == "0"
          Product.where('title LIKE ?', "%#{params[:term]}%")
        elsif params[:search_term] == "1"
          Product.where('description LIKE ?', "%#{params[:term]}%")
        end
      else
        Product.all
      end
    end
     
    
    
    private

    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image, :store_id, :category_id, :brand_id, :user_id, :term, :search_term)
    end

end
