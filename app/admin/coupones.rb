ActiveAdmin.register Coupone do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

form do |f|
    f.semantic_errors
    f.inputs "Coupone" do

    f.input :coupone_type
    f.input :value
    f.input :expiration_type
    f.input :code
    f.input :status
 
 
end
 f.actions
end

permit_params :coupone_type, :value, :expiration_type, :time, :no_of_usage, :code, :status
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
