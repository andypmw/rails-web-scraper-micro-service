Rails.application.routes.draw do
  get 'index-job'           =>  'index_job#index',  as: 'index_job_index_url'

  get 'index-job/:index_id' =>  'index_job#show',   as: 'index_job_show_url'

  post 'index-job'          =>  'index_job#create', as: 'index_job_create_url'

  delete 'index-job'        =>  'index_job#cancel', as: 'index_job_cancel_url'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
