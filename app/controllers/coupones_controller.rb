class CouponesController < InheritedResources::Base

  private

    def coupone_params
      params.require(:coupone).permit(:type, :value, :expiration_type, :time, :no_of_usage, :code, :status)
    end

end
