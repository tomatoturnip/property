Property::Application.routes.draw do

  resources :owners, only: [:new, :index, :create]

  resources :buildings, only: [:new, :index, :create]

end
