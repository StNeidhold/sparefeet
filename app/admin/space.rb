ActiveAdmin.register Space do

 permit_params :landlord_id, :size, :notes, :summary, :allow_boxes, :allow_furniture, :allow_sporting_goods, :street_address, :city, :state, :availability_date, :min_term, :dimensions

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
