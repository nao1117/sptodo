Rails.application.routes.draw do
  devise_for :users
  root to:"memos#index"
  resources :memos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :memos, only: :index, defaults: { format: 'json' } #defaultsオプションを利用して、このルーティングが来たらjson形式でレスポンスするよう指定。
  end
end
