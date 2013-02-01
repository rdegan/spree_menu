module Spree
  module Admin
    class MenusController < ResourceController
      
      def index
        @menus = Spree::Menu.only_parent
      end
      
      def show
        redirect_to(:action => :edit)
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
