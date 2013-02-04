module Spree
  class Menu < ActiveRecord::Base
    belongs_to :linkable, :polymorphic => true
    belongs_to :parent, :foreign_key => :parent_id, :class_name => 'Spree::Menu'
    has_many :children, :class_name => 'Spree::Menu', :foreign_key => :parent_id
    
    attr_accessible :presentation, :url, :parent, :position, :visible, :name, :linkable, :parent_id,
                    :linkable_id, :linkable_type, :category, :class_list
    
    validates :name, :presentation, :category, :presence => true
    validate :linkable_type, :presence => true, :if =>"url.blank?"
    validate :linkable_id, :presence => true, :if =>"url.blank?"
    validate :url, :presence => true, :if =>"linkable_type.blank? && linkable_id.blank?"
    
    scope :visible, lambda { where('visible IS NOT NULL AND visible = ?', true).order('position') }
    scope :category_visible, lambda {|cat| where('visible = true and parent_id IS NULL and category = ?', cat).order('position') }
    scope :only_parent, lambda { where('visible = true and parent_id IS NULL').order('category, position ASC') }
    
    def initialize(*args)
      super(*args)
      if self.position.blank?
        last_menu = Menu.only_parent.last
        self.position = last_menu ? last_menu.position + 1 : 0
      end
    end
  end
end