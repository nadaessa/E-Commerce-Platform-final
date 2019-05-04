class ProductsController < InheritedResources::Base

  def show
        
    @product = Product.find params[:id]

    @product_cat = Product.includes(:category).find(params[:id])
    @product_store = Product.includes(:store).find(params[:id])
    @product_brand = Product.includes(:brand).find(params[:id])
  end
  private

    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image, :store_id, :category_id, :brand_id, :user_id)
    end

end
