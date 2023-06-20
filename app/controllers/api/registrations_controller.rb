class Api::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  # POST /api/users
  def create
    build_resource(sign_up_params)

    if resource.save
      sign_up(resource_name, resource)
      render json: { status: 'SUCCESS', message: 'User created successfully', user: resource }
    else
      render json: { status: 'ERROR', message: 'User creation failed', errors: resource.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
