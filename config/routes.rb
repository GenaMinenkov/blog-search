Rails.application.routes.draw do
  get 'search', to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints lambda {|req| Post.find_by(domain: req.params[:domain]) } do
    get ':domain', to: 'posts#index'
    get ':domain/:slug', to: 'posts#show'
  end

  resources :likes, only: %i[create destroy]
end
