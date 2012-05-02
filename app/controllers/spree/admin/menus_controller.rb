module Spree
    module Admin


    class MenusController < ResourceController
      def index

        #@cms_events = CmsEvent.page(params[:page]).per(Spree::Config[:admin_products_per_page]).order('\'from\'')#per(Spree::Config[:admin_products_per_page])
        params[:search] ||= {}
        params[:search][:meta_sort] ||= "name.asc"

        @menus = @search.page(params[:page]).per(Spree::Config[:admin_products_per_page])
        #render :layout => 'admin'
      end

      def collection
        @search = super.metasearch(params[:search])
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


    end
  end
end
