ActiveAdmin.register Version do
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
filter :app

index do 
	selectable_column
	column :app
	column :name do |name|
		link_to(name.name, admin_version_path(name))
	end 
	column :code 
	column :AndriodVersion
end

show do
	attributes_table do 
		# row :logo do |logo|
		# 	url = url_for(logo.image)
		# 	raw("<img class='admin-logo' src='#{url}'></img>")
		# end
		# row :screenshots do |ss|
		# 	url = url_for(ss.screenshots)
		# 	raw("<img src='#{url}'></img>")
		# end
		row 'Logo' do |logo|
			image_tag logo.image, class: "admin-logo"
		end	
		
		# row 'screenshots' do |ss|
		# 	url = url_for(ss.screenshots), class: "screenshots"
		# 	raw("<img src='#{url}'></img>")
		# end

		row :screenshots
		
		row :name 
		row :code
		row :app
		row :description
		row "Andriod_Version" do 
			Version.last.AndriodVersion
		end
	end
end

permit_params :name, :code, :description, :AndriodVersion, :apk,:image, :app_id, screenshots: []

form partial: 'form'
form do |f|
    f.inputs "Version" do
      f.inputs :app
      f.inputs :name, url: admin_versions_path, fields: [:version_last_name]
      f.inputs :code
      f.inputs :AndriodVersion
      f.inputs :description
      f.input :apk, as: :file
      f.input :image, as: :file
      f.input :screenshots, as: :file, input_html: { multiple: true }
      end
    f.actions
  end
end
