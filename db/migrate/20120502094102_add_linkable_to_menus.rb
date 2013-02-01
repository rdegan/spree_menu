class AddLinkableToMenus < ActiveRecord::Migration
  def change
    add_column :spree_menus, :linkable_id, :integer, :after => :url
    add_column :spree_menus, :linkable_type, :string, :after => :linkable_id
    add_column :spree_menus, :category, :string, :after => :presentation
    add_column :spree_menus, :class_list, :string, :after => :category
  end
end
