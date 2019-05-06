class HomeController < ApplicationController
    #def index
     #   @products=Product.all
    #end


    def index
     
        # @products = Product.all
    @categories = Category.all
        # render plain: @product.inspect
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
     
    

    # def addItem
    #   @user = current_user.id
    #   @cartId = Cart.select(:id).where(user_id:@user).last.id
    #   @productId =params[:id]
    #   @product_quantity= Product.select(:quantity).where(id:@productId).last.quantity
    #   if @product_quantity > 0
    #   CartItem.create(quantity:1, cart_id:@cartId , product_id:@productId )
    #   flash[:success] = "added succesfully" 
    #   else

    #     flash[:alert] = "This product #{@productId}is not available" 
    #   end
    #   # @cartItem.save
    #   # render plain: @cartId.inspect
    #   redirect_to '/'
      
    # end
    
  
      def addItem
          @user = current_user.id
          @cartId = Cart.select(:id).where(user_id:@user).last.id
          @productId =params[:id]
          @product_quantity= Product.select(:quantity).where(id:@productId).last.quantity
          if @product_quantity > 0
              @ArrayProductId=CartItem.select(:product_id).where(cart_id: @cartId).all
              @ArrayProductId.each do |product|
                  if (product != @productId)
                  CartItem.create(quantity:1, cart_id:@cartId , product_id:@productId )
                  flash[:success] = "added succesfully"
   
                  elsif (product == @productId)
                    flash[:alert] = "increase Q"
                  end 
                  # logger.debug @ArrayProductId.inspect
                  # render plain: @ArrayProductId.inspect  
              end    
              
          else

            flash[:alert] = "This product #{@productId}is not available" 
          end
      
          redirect_to '/'
      
    end


    private

    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image, :store_id, :category_id, :brand_id, :user_id, :term, :search_term)
    end

end
