class HomeController < ApplicationController
    def index
        @products=Product.all
    end


    private

    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image, :store_id, :category_id, :brand_id, :user_id)
    end

end
