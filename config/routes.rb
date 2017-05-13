require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get '/' => 'index_job#say_hi', as: 'say_hi'

  get 'index-job/:customer_id' => 'index_job#show_customers_jobs', as: 'show_customers_jobs'

  get 'index-job/:customer_id/:index_job_id' => 'index_job#show_an_index_job', as: 'show_an_index_job'

  post 'index-job'          =>  'index_job#create', as: 'create'

  delete 'index-job'        =>  'index_job#cancel', as: 'cancel'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
