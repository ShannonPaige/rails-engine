Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'customers#show'
          get '/find_all',  to: 'customers#index'
          get 'random'
        end
        member do
          get '/invoices',          to: 'customers/invoices#index'
          get '/transactions',      to: 'customers/transactions#index'
          get '/favorite_merchant', to: 'customers/favorite_merchants#show'
        end
      end

      resources :invoice_items, only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'invoice_items#show'
          get '/find_all',  to: 'invoice_items#index'
          get 'random'
        end
        member do
          get '/invoice',      to: 'invoice_items/invoices#show'
          get '/item',         to: 'invoice_items/items#show'
        end
      end

      resources :invoices, only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'invoices#show'
          get '/find_all',  to: 'invoices#index'
          get 'random'
        end
        member do
          get '/transactions',  to: 'invoices/transactions#index'
          get '/invoice_items', to: 'invoices/invoice_items#index'
          get '/items',         to: 'invoices/items#index'
          get '/customer',      to: 'invoices/customers#show'
          get '/merchant',     to: 'invoices/merchants#index'
        end
      end

      resources :items, only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'items#show'
          get '/find_all',  to: 'items#index'
          get 'random'
        end
        member do
          get '/invoice_items', to: 'items/invoice_items#index'
          get '/merchant',      to: 'items/merchants#show'
          get 'best_day',       to: 'items/best_day#show'
        end
      end

      resources :merchants, only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',          to: 'merchants#show'
          get '/find_all',      to: 'merchants#index'
          get 'random'
          get '/revenue',       to: 'merchants/total_revenue#show'
          get '/most_revenue',  to: 'merchants/most_revenue#show'
        end
        member do
          get '/items',                             to: 'merchants/items#index'
          get '/invoices',                          to: 'merchants/invoices#index'
          get '/revenue',                           to: 'merchants/revenue#show'
          get '/customers_with_pending_invoices',   to: 'merchants/pending_customers#index'
          get '/favorite_customer',                 to: 'merchants/favorite_customers#index'
        end
      end

      resources :transactions, only: [:index, :show], defaults: {format: :json} do
        collection do
          get '/find',      to: 'transactions#show'
          get '/find_all',  to: 'transactions#index'
          get 'random'
        end
        member do
          get '/invoice',  to: 'transactions/invoices#show'
        end
      end
    end
  end
end
