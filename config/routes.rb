Rails.application.routes.draw do

  scope 'api/v1' do

    %w(accounts contacts campaigns opportunities leads tasks users).each do |entity|
      get "#{entity}"     => "ffcrm_api/v1/#{entity}#index", :format => 'json'
      get "#{entity}/:id" => "ffcrm_api/v1/#{entity}#show",  :format => 'json'
    end

  end

end
