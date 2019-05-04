class ProductsController < InheritedResources::Base

  def new
    @stores = Store.all
    @categories = Category.all
    @brands = Brand.all
    @product = Product.new
    #render plain: @users.inspect
  end

  def edit
    @stores = Store.all
    @categories = Category.all
    @brands = Brand.all
    @product = Product.find(params[:id])
    end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
        redirect_to @product
    else
        render 'new'
    end
  end

  
  private

    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image, :store_id, :category_id, :brand_id, :user_id)
    end

end
