Spree::Product.class_eval do
  has_many :menus, :as => :linkable
end