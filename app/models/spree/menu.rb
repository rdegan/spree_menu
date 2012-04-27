module Spree
  class Menu < ActiveRecord::Base

    scope :visible, lambda { where('visible = true and parent_id IS NULL').order('position DESC') }

    validates :name,:presentation,:url , :presence => true

    has_many :children, :class_name => 'Menu', :foreign_key => :parent_id
    belongs_to :parent, :foreign_key =>  :parent_id, :class_name => 'Menu'
  end
end