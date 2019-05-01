class UserCouponesController < InheritedResources::Base

  private

    def user_coupone_params
      params.require(:user_coupone).permit(:user_id, :coupone)
    end

end
