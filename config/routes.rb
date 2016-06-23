Rails.application.routes.draw do

  #root
  root 'welcome#index', :as => 'home'
  post '/company/search', controller: 'companies', action: 'search', :as => 'search_company'

  #general
  post "/upload", controller: 'parsers', action: 'upload'
  post "/parsers", controller: 'parsers', action: 'index', :as => "index_parser"
  resources :parsers

  #company
  get  '/company/new' => 'companies#new'
  get  '/company/:id' => 'companies#show', :as => 'company'
  post '/company/new' => 'companies#create', :as => 'create_company'
  post 'company/edit' => 'companies#edit', :as => 'edit_company'
  post '/company/update' => 'companies#update', :as => 'update_company'

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

  #ranking
  get 'ranking/grade/all' => 'rankings#grade_all', :as => 'ranking_grade'
  get 'ranking/response/all' => 'rankings#response_time_all', :as => 'ranking_response'
  post 'ranking/response/segment'  => 'rankings#segment_selected'

  #segment
  get '/segments/show_segments', controller: 'segments', action: 'show_segment', :as => 'segment'

  #management
  get 'management' => 'managements#index', :as => 'management_attach'
  get 'managements' => 'managements#company_denunciations', :as => 'management_company'

  #Comment
  post '/comment' => 'comments#create', :as=> 'create_comment'
  get '/comment/delete' => 'comments#destroy', :as => 'delete_comment'
  post '/comment/edit' => 'comments#edit', :as => 'edit_comment'


  #evaluation
  post '/company/show', controller: 'evaluations', action: 'rate', :as => 'rate'
  post '/company/response', controller: 'evaluations', action: 'response_time', :as => 'response_time'


  #topic
  resources :companies do
    resources :topics
  end

  resources :topics

  resources :attaches

  get 'management/attachs_approve', controller: 'attaches', action: 'approve', :as => 'approve'
  get 'management/attachs_reject', controller: 'attaches', action: 'reject', :as => 'reject'

  post '/topic_denunciation_create' => 'denunciations#create', :as => 'create_topic_denunciation'
  post '/topic_denunciation_destroy' => 'denunciations#destroy', :as => 'destroy_topic_denunciation'
  post '/comment_denunciation_create' => 'denunciations#create_for_comment', :as => 'create_comment_denunciation'

  #questions
  get '/questions/create'   =>  'questions#create', :as => 'create_questions'
  post'/questions/new'      => 'questions#new', :as => 'new_questions'
  #get '/questions/:id'      => 'questions#show', :as => 'questions_show'
  get '/questions/:id/results/' => 'questions#results',  :as => 'results_questions'

  #faq
  post 'company/faq', controller: 'faq', action: 'create', :as => 'faq'


  #resources :companies do
  #  resources :questions
  #end

  resources :questions


  #votes
  get '/votes' => 'votes#update', action: 'update', :as => 'update_vote'
  put '/votes' => 'votes#update'

  #company_denunciation
  post '/company_denunciation_create' => 'company_denunciations#create', :as => 'create_company_denunciation'
  post '/company_denunciation_destroy' => 'company_denunciations#destroy', :as => 'destroy_company_denunciation'
  get '/company_denunciation/show' => 'company_denunciations#show', :as => 'show_company_denunciation'

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
