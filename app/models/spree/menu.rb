module Spree
  class Menu < ActiveRecord::Base

    scope :visible, lambda { where('visible = true and parent_id IS NULL').order('position') }

    validates :name,:presentation , :presence => true
    validate :linkable_type, :presence => true, :if =>"url.blank?"
    validate :linkable_id, :presence => true, :if =>"url.blank?"

    validate :url, :presence => true, :if =>"linkable_type.blank? && linkable_id.blank?"

    has_many :children, :class_name => 'Menu', :foreign_key => :parent_id
    belongs_to :parent, :foreign_key =>  :parent_id, :class_name => 'Menu'
    belongs_to :linkable, :polymorphic => true
  end
end