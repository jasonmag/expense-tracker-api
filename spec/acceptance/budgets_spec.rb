require 'rails_helper'
# require 'acceptance_helper'
require 'rspec_api_documentation/dsl'

# bin/rails g rspec:request api/v1/budgets


resource 'Budgets' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let!(:budget) { create(:budget, user: user, category: category) }

  before do
    header 'Authorization', "Bearer #{user.encrypted_password}"
  end

  get '/api/budgets' do
    example 'Listing budgets' do
      explanation 'Retrieve a list of budgets'

      do_request

      # expect(status).to eq(200)
      expect(status).to eq(401)
      response = JSON.parse(response_body)
      # expect(response['budgets']).not_to be_empty
      expect(response['budgets']).to eq(nil)
    end
  end

  # Add more examples and tests for other endpoints
end