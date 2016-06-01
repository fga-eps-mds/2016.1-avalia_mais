Rails.application.routes.draw do

  #root
  root 'welcome#index', :as => 'home'
  post '/company/search', controller: 'companies', action: 'search', :as => 'search_company'

  #general
  post "/upload", controller: 'parsers', action: 'upload'
  post "/parsers", controller: 'parsers', action: 'index', :as => "index_parser"
  resources :parsers

  get  '/company/new' => 'companies#new'
  get  '/company/:id' => 'companies#show', :as => 'company'
  get '/company/:search' => 'companies#search', :as => 'company_search'
  post '/company/new' => 'companies#create', :as => 'create_company'

  #users
  get   '/users/new'      => 'users#new'
  post  '/users/new'      => 'users#create', :as => 'create_user'
  get   '/users/:id'      => 'users#show', :as => 'user_show'
  get   '/users/edit/:id' => 'users#edit', :as => 'user_edit'

  patch '/users/update/', controller: 'users', action: 'update', :as => 'update_user'
  patch '/users/update/:id', controller: 'users', action: 'update_password', :as => 'update_user_password'
  patch '/users/destroy/', controller: 'users', action: 'destroy', :as => 'destroy_user_now'

  #survey
  post '/survey/new' => 'surveys#create'
  get   '/survey/new' => 'surveys#new'

  #option
  post '/option/new' => 'option#create'
  get   '/option/new' => 'option#new'

  #login
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  #segment
  get '/segments/show_segments', controller: 'segments', action: 'show_segment', :as => 'segment'

  #evaluation
  post '/company/show', controller: 'evaluations', action: 'rate', :as => 'rate'
  post '/company/response', controller: 'evaluations', action: 'response_time', :as => 'response_time'

  #questions
  get '/questions/new', controller: 'questions', action: 'new', :as => 'questions'
  post'/questions/new'      => 'questions#create', :as => 'create_questions'
  get '/questions/:id'      => 'questions#show', :as => 'questions_show'
  get '/questions/:id/results/' => 'questions#results', action: 'results', :as => 'results_questions'
  get '/votes' => 'votes#update', action: 'update', :as => 'update_vote'
  put '/votes' => 'votes#update'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
