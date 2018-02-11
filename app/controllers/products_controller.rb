class ProductsController < ApplicationController
    before_filter :authorize

    def index
        @products = Product.all
    end

    def new
    end

    def show
        @product = Product.find_by(id: params[:id])
    end

    def edit
    end
end
