require 'bundler/setup'
Bundler.require

require "vienna"
require "grape"
require "grape-swagger"
require_relative "twitter/api.rb"

module API
  class Root < Grape::API
    format :json
    
    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    mount Twitter::API
    add_swagger_documentation
  end
end

run Rack::Cascade.new [API::Root, Vienna]
