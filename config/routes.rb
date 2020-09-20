Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/top'
  get 'homes/readme'
  get 'homes/data' => 'homes#data'
  get 'homes/graph'
  post 'homes/graph'
  resources :homes
  get 'homes/index'
  # get 'homes/show'
  # post 'homes/top' => 'homes#import'
  get 'hello/index'

  resources :homes do
    collection {post :import}
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
