Scheduler::Application.routes.draw do
  #match 'candidates/:name/calendar(/:year(/:month))' =>  'calendar#index', :as => :calendar_candidate, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  #match 'recruiters/:name/calendar(/:year(/:month))' =>  'calendar#index', :as => :calendar_recruiter, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}


  root :to => 'welcome#index'

  get "welcome/index" => "welcome#index"
  post "user/modify" => "users#modify"
  resources :candidates
  resources :recruiters
  post "event/create" => "events#create"
  get "recruiter/get_candidates" => "recruiter#get_candidates"
  get "candidate/:id/list" => "candidates#list", as: 'list_candidate'
  get "welcome/show" => "welcome#show"
  get "recruiter/:id/list" => "recruiters#list", as: 'list_recruiter'

  post '/logout' => "welcome#logout"
  #For Debug purposes, this will automatically go to these pages
  post "recruiter/create" => "recruiters#create"
  post "candidate/create" => "candidates#create"
  post "recruiter/:id/add_candidate" => "recruiters#add_candidate"
  post "recruiter/:id/message_candidate" => "recruiters#message_candidate"
  post "candidate/:id/add_recruiter" => "candidates#add_recruiter"

  match "welcome/show", :to => redirect("welcome/show")
  #match "candidates", :to => redirect('candidates/show')

  #match "recruiters", :to => redirect('recruiters/show')
  #Just to go to the specific pages


#temporary
  match 'login', :to => redirect('/welcome/index')

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     endr
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
