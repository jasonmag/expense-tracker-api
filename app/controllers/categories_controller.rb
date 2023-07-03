class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /api/categories
  def index
    @categories = Category.all
    render json: { status: 'SUCCESS', message: 'Categories loaded', categories: @categories }
  end

  # GET /api/categories/:id
  def show
    render json: { status: 'SUCCESS', message: 'Category loaded', category: @category }
  end

  # POST /api/categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: { status: 'SUCCESS', message: 'Category created', category: @category }
    else
      render json: { status: 'ERROR', message: 'Category creation failed', errors: @category.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /api/categories/:id
  def update
    if @category.update(category_params)
      render json: { status: 'SUCCESS', message: 'Category updated', category: @category }
    else
      render json: { status: 'ERROR', message: 'Category update failed', errors: @category.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /api/categories/:id
  def destroy
    @category.destroy
    render json: { status: 'SUCCESS', message: 'Category deleted' }
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
