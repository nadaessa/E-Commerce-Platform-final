ActiveAdmin.register Brand do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
form do |f|
    f.semantic_errors
    f.inputs "Brand" do

    f.input :name
 
end
 f.actions
end

permit_params :name
# or

# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
