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
