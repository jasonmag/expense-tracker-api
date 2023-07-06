class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      render json: { message: 'User registration successful', user: resource }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def respond_with(resource, _opts = {})
    pp resource
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up sucessfully.',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: { message: 'Something went wrong.' }, status: :unprocessable_entity
  end
end