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
      render 'edit'
    end
  end

  def free_shipping
    @products = Product.free_shipping.page(params[:page])
    render 'free_shipping'
  end

  def sort_by_price
    @products = Product.sort_by_price.page(params[:page])
    render 'sort_by_price'
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to products_url
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :url, :image_link)
  end
end
