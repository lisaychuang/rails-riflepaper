class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @category.products.build(name: " ")
  end

  def create
    category = Category.find_or_create_by(category_params)
    redirect_to categories_path
  end

  def edit
  end

  def show
    @category = Category.find_by(id: params[:id])
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
