Rails.application.routes.draw do
  
  namespace :admin do
    # Categories
    get 'categories',           to: 'categories#index', as: 'categories'
    get 'categories/new',       to: 'categories#new',   as: 'new_category'
    get 'categories/:id',       to: 'categories#show',  as: 'category'
    get 'categories/:id/edit',  to: 'categories#edit',  as: 'edit_category'

    post    'categories',         to: 'categories#create'
    put     'categories/:id',     to: 'categories#update'
    patch   'categories/:id',     to: 'categories#update'
    delete  'categories/:id',     to: 'categories#destroy'
  end

end