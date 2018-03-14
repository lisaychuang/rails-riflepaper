class ProductsController < ApplicationController
  before_filter :authorize

  def index
    @products = Product.order(name: :asc).page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      redirect_to edit_product_path(@product)
    end
  end

  def free_shipping
    @products = Product.free_shipping
    render 'free_shipping'
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to products_url
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :url, :image_link)
  end
end
