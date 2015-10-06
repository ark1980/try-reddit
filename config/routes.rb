Rails.application.routes.draw do

  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  resources :posts do
    resources :comments, only: [:create, :destroy, :new]
  end

end
