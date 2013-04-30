Rails.application.routes.draw do

  # namespace the API
  #~ namespace :api do
    #namespace :v1 do

      get 'api/v1/opportunities/index' => 'ffcrm_api/v1/opportunities#index', :format => :json
      get 'api/v1/opportunities/:id'   => 'ffcrm_api/v1/opportunities#show',  :format => :json

      get 'api/v1/contacts/index' => 'ffcrm_api/v1/contacts#index', :format => :json
      get 'api/v1/contacts/:id'   => 'ffcrm_api/v1/contacts#show',  :format => :json

    #end
  #end

end
