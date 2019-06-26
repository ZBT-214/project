ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    br
        div text_align: :center
        # columns class: "dashboard-shortcut" do 
        #     column max_width: "200px", class: "dash" do
        #         span "Recent Apps", class: "dash-title" do
        #             br 
        #                 attributes_table_for 'Apps' do
        #                 App.last(5).map do |app|
        #                     columns link_to(app.name, admin_app_path(app), class: "dashboard")
        #                 end
        #             end
        #             br
        #         end
        #     end
        #     br

        #     column max_width: "200px;", class: "dash" do
        #         span "Recent version updates", class: "dash-title" do
        #             br
        #         attributes_table_for 'Versions' do
        #                 Version.last(5).each do |version|
        #                     columns link_to(version.name + " for #{version.app.name}", admin_version_path(version), class: "dashboard")
        #                 end
        #             end
        #         br
        #         end
        #     end
        #     br

        #     column max_width: "200px;", class: "dash" do
        #     span "Recent Users", class: "dash-title" do
        #         br
        #         attributes_table_for "User" do 
        #                 User.last(5).map do |user|
        #                     columns link_to(user.email, admin_user_path(user), class: "dashboard")
        #                 end
        #             end
        #         br
        #         end
        #     end

  columns class: "dashboard-shortcut"  do
      column max_width: "210px;" do
        panel "Recent users" ,class: "dash" do
          ul do
            User.last(5).map do |user|
              li link_to(user.email, admin_user_path(user), class: "dashboard")
            end
          end
          br
        end
      end

    column max_width: "250px;" do
        panel "Recent versions" ,class: "dash" do 
          ul do
            Version.last(5).map do |version|
              li link_to(version.name + " for #{version.app.name}", admin_version_path(version), class: "dashboard")
            end
          end
          br
        end
      end
    

    column max_width: "200px;"do
      panel "Recent Apps" ,class: "dash" do 
        ul do 
          App.last(5).map do |app|
            li link_to(app.name, admin_app_path(app), class: "dashboard")
          end
        end
        br
      end
  end
end
br

    


    



    # columns do 
    #     column do
    #         panel "Recent Users" do
    #             ul do 
    #                 User.last(5).map do |user|
    #                     li link_to(user.email, admin_user_path(user))
    #                 end
    #             end
    #         end
    #     end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end

  end # content
end
