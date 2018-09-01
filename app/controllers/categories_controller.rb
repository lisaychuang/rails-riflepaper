class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @category.products.build(name: " ")
  end

  def create
    @category = Category.create(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
    render json: @category, status: 200
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end

  private

  def category_params
    params.require(:category).permit(:name, :link, :img_url,
      products_attributes: [
        :name,
        :price,
        :url,
        :image_link
      ])
  end
end
