class ProductsController < ApplicationController
    before_filter :authorize

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)
        redirect_to @product
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

    private

  def product_params
    params.require(:product).permit(:name, :price, :url, :image_link)
  end
end