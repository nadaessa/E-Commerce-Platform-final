class UserCouponesController < InheritedResources::Base

  private

    def user_coupone_params
      params.require(:user_coupone).permit(:coupone_id, :user_id)
    end

end
