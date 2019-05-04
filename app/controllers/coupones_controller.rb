class CouponesController < InheritedResources::Base
  def index
    @coupones = Coupone.all
  end
   
  def show
    @coupone = Coupone.find(params[:id])
  end
  def new
    @coupone = Coupone.new
  end
  def edit
    @coupone = Coupone.find(params[:id])
  end

  def create
    @coupone = Coupone.new(coupone_params)
      if @coupone .save
          redirect_to  @coupone 
      else
        render 'new'
      end
  end

  def update
    @coupone  = Coupone.find(params[:id])
 
    if  @coupone .update(coupone_params)
      redirect_to  @coupone
    else
      render 'edit'
    end
  end
 
  def destroy
    @coupone  = Coupone.find(params[:id])
    @coupone .destroy
 
    redirect_to categories_path
  end
  private

    def coupone_params
      params.require(:coupone).permit(:type, :value, :expiration_type, :time, :no_of_usage, :code, :status)
    end

end
