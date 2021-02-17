Rails.application.routes.draw do
  resources :orders do
    resources :products, only: %i[index create]
  end

  resources :products
  resources :stores
  scope path: '/api' do
    api_version(module: 'Api::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      resources :products, only: %i[show update destroy]
      resources :orders do
        resources :products, only: %i[index create]
      end
    end
  end
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
