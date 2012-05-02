class AddLinkableToMenus < ActiveRecord::Migration
  def change
      add_column :spree_menus, :linkable_id, :integer
      add_column :spree_menus, :linkable_type, :string
  end
end
