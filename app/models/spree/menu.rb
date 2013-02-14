module Spree
  class Menu < ActiveRecord::Base
    belongs_to :linkable, :polymorphic => true
    belongs_to :parent, :foreign_key => :parent_id, :class_name => 'Spree::Menu'
    has_many :children, :class_name => 'Spree::Menu', :foreign_key => :parent_id, :dependent => :destroy
    
    before_create :set_presentation
    before_update :set_presentation
    
    attr_accessible :presentation, :url, :parent, :position, :visible, :name, :linkable, :parent_id,
                    :linkable_id, :linkable_type, :category, :class_list
    
    validates :name, :category, :presence => true
    validate :linkable_type, :presence => true, :if =>"url.blank?"
    validate :linkable_id, :presence => true, :if =>"url.blank?"
    validate :url, :presence => true, :if =>"linkable_type.blank? && linkable_id.blank?"
    
    scope :visible, lambda { where('visible = ?', true).order('position') }
    scope :category_visible, lambda {|cat| where('visible = ? and parent_id IS NULL and category = ?', true, cat).order('position') }
    scope :only_parent, lambda { where('parent_id IS NULL').order('category, position ASC') }
    
    def initialize(*args)
      super(*args)
      if self.position.blank?
        last_menu = Menu.where({:category => (self.category rescue ""), :parent_id => (self.parent_id rescue nil)}).last
        self.position = last_menu ? last_menu.position + 1 : 0
      end
    end
    
    def set_presentation
      self.presentation = self.name.titleize
    end
  end
end