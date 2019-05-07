ActiveAdmin.register Coupone do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

form do |f|
   
    f.semantic_errors
    f.inputs "Coupone" do

    f.input :coupone_type
    f.input :value
   
    f.input :expiration_type, as: :select, class: 'select-type', :input_html => { action: 'show' ,
    :onchange => "
    if ($(this).val() == 'time') {
    $('.time-tab').show();
    $('.usage-tab').hide();
    }
    else {
    $('.usage-tab').show();
    $('.time-tab').hide();
    }
    "
    }
    
    f.inputs 'time', class: 'time-tab', style: "display: #{f.object.expiration_type == 'time' ? 'block' : 'none'}" do
    f.input :time, :as => :string
    end
    
    f.inputs 'no_of_usage', class: 'usage-tab', style: "display: #{f.object.expiration_type == 'no_of_usage' ? 'block' : 'none'}" do
    f.input :no_of_usage, :as => :string
    end
    
 

    f.input :code
    f.input :status
 
    end

 f.actions
end

permit_params :coupone_type, :value, :expiration_type, :time, :no_of_usage, :code, :status

end
