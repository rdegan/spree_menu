class CreateMenus < ActiveRecord::Migration
  def change
    create_table :spree_menus do |t|
      t.string :name
      t.string :presentation
      t.string :url
      t.integer :position
      t.integer :parent_id
      t.boolean :visible

      t.timestamps
    end
  end
end
