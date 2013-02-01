# encoding: UTF-8

module Spree
  module MenuHelper
    
    def link(menu)
      if menu.url.blank?
        return product_path(menu.linkable) if menu.linkable.class == Spree::Product
        return seo_url(menu.linkable) if menu.linkable.class == Spree::Taxon
        return menu.linkable.slug if menu.linkable.class == Spree::Page
      else
        menu.url
      end
    end
    
    def insert_menu(params={})
      params[:id] ||= "header_menu"
      params[:class] ||= "listing menu"
      params[:category] ||= ""
      @@menu = Spree::Menu.category_visible(params[:category])
      if @@menu.blank?
        return ''
      end
      
      content_tag(:ul, show_children(params, @@menu), :id => params[:id], :class => params[:class]).html_safe
    end
    
    def show_children(params, menu)
            
      menu.map do |m|
        content_tag(:li, :class => "#{m.class_list}") do
          lim = []
          
          lim << link_to(m.presentation, link(m))
          lim << content_tag(:ul, show_sub_children(m.children.visible)) if !m.children.visible.blank?
                              
          lim.join.html_safe
        end
      end.join.html_safe
    end
    
    def show_sub_children(children)
      children.map do |c|
        content_tag(:li, :class => "#{c.class_list}") do
          lic = []
          lic << link_to(c.presentation, link(c))
          lic << content_tag(:ul, show_sub_children(c.children.visible)) if !c.children.visible.blank?
          
          lic.join.html_safe
        end
      end.join.html_safe
    end
  end
end
