class CategoriesController < InheritedResources::Base

  def index
    @products = Product.all
    @categories = Category.all
   
    Rails.logger.debug("My object: #{@products.inspect}")
  end
   
  def show
    @category = Category.find(params[:id])

  
  end
  def new
    @category = Category.new
  end
  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
      if @category .save
          redirect_to @category
      else
        render 'new'
      end
  end
  def update
    @category  = Category.find(params[:id])
 
    if @category .update(category_params)
      redirect_to @category 
    else
      render 'edit'
    end
  end
 
  def destroy
    @category  = Category.find(params[:id])
    @category .destroy
 
    redirect_to categories_path
  end
 
  def get_products_of_category
    #  @category = Category.find(params[:id])
    # @products = Product.select(:name, :price, :title).where(category_id : @category)


    # @products = Product.where(category_id: @category)
  end  

  private

    def category_params
      params.require(:category).permit(:name)
    end

end
