module FfcrmApi
  class Engine < ::Rails::Engine

    require 'active_model_serializers' # needed so our serializers can see ActiveModel::Serializer

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

  end
end
