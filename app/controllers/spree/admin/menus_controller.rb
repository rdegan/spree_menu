module Spree
  module Admin


    class MenusController < ResourceController
      def index

        #@cms_events = CmsEvent.page(params[:page]).per(Spree::Config[:admin_products_per_page]).order('\'from\'')#per(Spree::Config[:admin_products_per_page])
        params[:search] ||= {}
        params[:search][:meta_sort] ||= "name.asc"

        @menus = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
        #render :layout => 'admin'
      end

      def collection
        @search = super.ransack(params[:search])
      end

      def new

        @menu = @object
      end

      def edit
        @menu = @object
      end


      def update_positions
        params[:positions].each do |id, index|
          Spree::Menu.update_all(['position=?', index], ['id=?', id])
        end

        respond_to do |format|
          format.html { redirect_to admin_menus_url() }
          format.js  { render :text => 'Ok' }
        end
      end
      
=begin
        TODO da togliere: sarebbe preferibile lasciare :
             def location_after_save
                 admin_static_pages_url
             end
        e togliere:
          - def update
          - def create
=end

              def update
                invoke_callbacks(:update, :before)
                if @object.update_attributes(params[object_name])
                  invoke_callbacks(:update, :after)
                  flash.notice = flash_message_for(@object, :successfully_updated)
                  redirect_to location_after_save
                  #respond_with(@object) do |format|
                  #  format.html { redirect_to self.location_after_save }
                  #  format.js   { render :layout => false }
                  #end
                else
                  invoke_callbacks(:update, :fails)
                  respond_with(@object)
                end
              end

              def create
                invoke_callbacks(:create, :before)
                if @object.save
                  invoke_callbacks(:create, :after)
                  flash.notice = flash_message_for(@object, :successfully_created)
                  redirect_to location_after_save
                  #respond_with(@object) do |format|
                  #  format.html { redirect_to location_after_save }
                  #  format.js   { render :layout => false }
                  #end
                else
                  invoke_callbacks(:create, :fails)
                  respond_with(@object)
                end
              end


            protected

              def location_after_save
                 admin_menus_url
              end

    end
  end
end
