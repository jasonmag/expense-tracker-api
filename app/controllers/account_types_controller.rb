class AccountTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account_type, only: %i[ show update destroy ]

  # GET /account_types
  def index
    @account_types = current_user.account_types

    render json: { status: 'SUCCESS', message: 'Account type loaded', account_type: @account_types }
  end

  # GET /account_types/1
  def show
    render json: { status: 'SUCCESS', message: 'Account type loaded', account_type: @account_type }
  end

  # POST /account_types
  def create
    @account_type = current_user.account_types.build(account_type_params)

    if @account_type.save
      render json: { status: 'SUCCESS', message: 'Account type created', account_type: @account_type }
    else
      render json: { status: 'ERROR', message: 'Account type creation failed', errors: @account_type.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /account_types/1
  def update
    if @account_type.update(account_type_params)
      render json: { status: 'SUCCESS', message: 'Account type updated', expense: @account_type }
    else
      render json: { status: 'ERROR', message: 'Account type update failed', errors: @account_type.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  # DELETE /account_types/1
  def destroy
    @account_type.destroy
    render json: { status: 'Success', message: 'Account Type Deleted' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_type
      @account_type = current_user.account_types.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_type_params
      params.require(:account_type).permit(:name)
    end
end
