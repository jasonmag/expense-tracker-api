class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST /api/users/sign_in
  def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      sign_in(user)
      render json: { status: 'SUCCESS', message: 'User signed in successfully', user: user }
    else
      render json: { status: 'ERROR', message: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  # DELETE /api/users/sign_out
  def destroy
    sign_out(current_user)
    render json: { status: 'SUCCESS', message: 'User signed out successfully' }
  end
end
