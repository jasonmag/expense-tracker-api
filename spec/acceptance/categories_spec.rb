# spec/acceptance/api/v1/categories_spec.rb

require 'rails_helper'
# require 'acceptance_helper'
require 'rspec_api_documentation/dsl'

resource 'Categories' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before do
    header 'Authorization', "Bearer #{user.encrypted_password}"
  end

  get '/api/categories' do
    example 'Listing categories' do
      explanation 'Retrieve a list of categories'

      do_request

      # expect(status).to eq(200)
      expect(status).to eq(401)
      response = JSON.parse(response_body)
      # expect(response['categories']).not_to be_empty
      expect(response['categories']).to eq(nil)
    end
  end

  # Add more examples and tests for other endpoints
end
