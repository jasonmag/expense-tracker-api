class Api::ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET /api/expenses
  def index
    @expenses = current_user.expenses
    render json: { status: 'SUCCESS', message: 'Expenses loaded', expenses: @expenses }
  end

  # GET /api/expenses/:id
  def show
    render json: { status: 'SUCCESS', message: 'Expense loaded', expense: @expense }
  end

  # POST /api/expenses
  def create
    @expense = current_user.expenses.build(expense_params)

    if @expense.save
      render json: { status: 'SUCCESS', message: 'Expense created', expense: @expense }
    else
      render json: { status: 'ERROR', message: 'Expense creation failed', errors: @expense.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /api/expenses/:id
  def update
    if @expense.update(expense_params)
      render json: { status: 'SUCCESS', message: 'Expense updated', expense: @expense }
    else
      render json: { status: 'ERROR', message: 'Expense update failed', errors: @expense.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /api/expenses/:id
  def destroy
    @expense.destroy
    render json: { status: 'SUCCESS', message: 'Expense deleted' }
  end

  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:amount, :category, :date, :description)
  end
end
