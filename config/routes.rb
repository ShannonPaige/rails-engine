Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/customers/find',                to: 'customers#show'
      get '/customers/find_all',            to: 'customers#find_all'
      resources :customers,                 only: [:index, :show]
      get '/invoice_items/find',            to: 'invoice_items#show'
      get '/invoice_items/find_all',        to: 'invoice_items#find_all'
      resources :invoice_items,             only: [:index, :show]
      get '/invoices/find',                 to: 'invoices#show'
      get '/invoices/find_all',             to: 'invoices#find_all'
      resources :invoices,                  only: [:index, :show]
      get '/items/find',                    to: 'items#show'
      get '/items/find_all',                to: 'items#find_all'
      resources :items,                     only: [:index, :show]
      get '/merchants/find',                to: 'merchants#show'
      get '/merchants/find_all',            to: 'merchants#find_all'
      resources :merchants,                 only: [:index, :show]
      get '/transactions/find',             to: 'transactions#show'
      get '/transactions/find_all',         to: 'transactions#find_all'
      resources :transactions,              only: [:index, :show]
    end
  end
end
