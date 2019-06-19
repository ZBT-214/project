ActiveAdmin.register App do
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
index do 
	
	selectable_column	

	column('logo') do |logo| 
		#Individual App => 1 App.versions.last.image
		url = url_for(logo.versions.last.image)
		raw("<img class='admin-logo' src='#{url}'></img>")
	 end
	
	column :name do |name|
		link_to(name.name, admin_app_path(name))
	end

	column 'Short description' do |sd|
		sd.shortdescription
	end

	
	column :is_public
	column :user
	
end

show do
	attributes_table do 
		row :name
		row :user
		row 'Short description' do |sd|
			sd.shortdescription
		end
		row :description
		row :is_public
		row :versions
		row :created_at
	end
end

config.filters = false
config.batch_actions = false

permit_params :name, :description, :shortdescription,:is_public, :user_id, :version_id
form partial: 'form'
form do |f|
	f.semantic_errors *f.object.errors.keys
    f.inputs "App" do  
      f.inputs :name
      f.inputs :description
      f.inputs :shortdescription
      f.inputs :is_public
      f.inputs :user
    end
    f.actions
  end

end
