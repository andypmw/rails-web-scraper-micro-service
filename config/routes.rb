require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  get 'index-job'           =>  'index_job#index',  as: 'index'

  get 'index-job/:index_id' =>  'index_job#show',   as: 'show'

  post 'index-job'          =>  'index_job#create', as: 'create'

  delete 'index-job'        =>  'index_job#cancel', as: 'cancel'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
