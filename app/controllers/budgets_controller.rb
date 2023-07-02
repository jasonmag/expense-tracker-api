class Api::BudgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget, only: [:show, :update, :destroy]

  # GET /api/budgets
  def index
    @budgets = current_user.budgets
    render json: { status: 'SUCCESS', message: 'Budgets loaded', budgets: @budgets }
  end

  # GET /api/budgets/:id
  def show
    render json: { status: 'SUCCESS', message: 'Budget loaded', budget: @budget }
  end

  # POST /api/budgets
  def create
    @budget = current_user.budgets.build(budget_params)

    if @budget.save
      render json: { status: 'SUCCESS', message: 'Budget created', budget: @budget }
    else
      render json: { status: 'ERROR', message: 'Budget creation failed', errors: @budget.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /api/budgets/:id
  def update
    if @budget.update(budget_params)
      render json: { status: 'SUCCESS', message: 'Budget updated', budget: @budget }
    else
      render json: { status: 'ERROR', message: 'Budget update failed', errors: @budget.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /api/budgets/:id
  def destroy
    @budget.destroy
    render json: { status: 'SUCCESS', message: 'Budget deleted' }
  end

  private

  def set_budget
    @budget = current_user.budgets.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:amount, :category_id)
  end
end
