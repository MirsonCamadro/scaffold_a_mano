Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "posts", to: "posts#index"
  post "posts", to: "posts#create"
  get "posts/new", to: "posts#new", as: "posts_new"
  get "posts/:id/edit", to: "posts#edit", as: "post_edit"
  get "posts/:id", to: "posts#show", as: "post"
  patch  "posts/:id", to: "posts#update"
  delete "posts/:id", to: "posts#destroy"

  get "api/v1/posts", to: "posts#api_post"

  root "posts#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
