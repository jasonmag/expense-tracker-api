# spec/acceptance_helper.rb

require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  # config.format = :json
  config.format = :open_api
  config.curl_host = 'http://localhost:3000'
  config.api_name = 'Expense Tracker API Documentation'
  # config.swagger_root = Rails.root.to_s + '/swagger'
  config.keep_source_order = true
  config.api_explanation = 'API endpoints for the Expense Tracker application.'
end

# RSpec.configure do |config|
#   config.include RspecApiDocumentation::DSL, type: :request
# end
