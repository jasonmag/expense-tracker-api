class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[ show update destroy ]

  # GET /accounts
  def index
    @accounts = current_user.accounts

    render json: { status: 'SUCCESS', message: 'Accounts loaded', accounts: @accounts }
  end

  # GET /accounts/1
  def show
    render json: { status: 'SUCCESS', message: 'Account loaded', account: @account }
  end

  # POST /accounts
  def create
    @account = current_user.accounts.build(account_params)

    if @account.save
      render json: { status: 'SUCCESS', message: 'Account created', account: @account }
    else
      render json: { status: 'ERROR', message: 'Account creation failed', errors: @account.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      render json: { status: 'SUCCESS', message: 'Account updated', account: @account }
    else
      render json: { status: 'ERROR', message: 'Account update failed', errors: @account.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    render json: { status: 'SUCCESS', message: 'Account deleted' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.accounts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :description, :user_id, :account_types_id)
    end
end
