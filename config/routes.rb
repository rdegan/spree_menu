Spree::Core::Engine.routes.prepend do
  # Add your extension routes here
  namespace :admin do
    resources :menus do
      collection do
        post :update_positions
      end
    end
  end
end
