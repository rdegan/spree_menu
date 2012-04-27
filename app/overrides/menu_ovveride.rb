Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "menu_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:menus) %>")