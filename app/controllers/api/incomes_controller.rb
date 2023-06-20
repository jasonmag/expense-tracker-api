class Api::IncomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_income, only: [:show, :update, :destroy]

  # GET /api/incomes
  def index
    @incomes = current_user.incomes
    render json: { status: 'SUCCESS', message: 'Incomes loaded', incomes: @incomes }
  end

  # GET /api/incomes/:id
  def show
    render json: { status: 'SUCCESS', message: 'Income loaded', income: @income }
  end

  # POST /api/incomes
  def create
    @income = current_user.incomes.build(income_params)

    if @income.save
      render json: { status: 'SUCCESS', message: 'Income created', income: @income }
    else
      render json: { status: 'ERROR', message: 'Income creation failed', errors: @income.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /api/incomes/:id
  def update
    if @income.update(income_params)
      render json: { status: 'SUCCESS', message: 'Income updated', income: @income }
    else
      render json: { status: 'ERROR', message: 'Income update failed', errors: @income.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /api/incomes/:id
  def destroy
    @income.destroy
    render json: { status: 'SUCCESS', message: 'Income deleted' }
  end

  private

  def set_income
    @income = current_user.incomes.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:amount, :source, :date)
  end
end
