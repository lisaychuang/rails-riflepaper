class ColorsController < ApplicationController
    before_filter :authorize

    def index
        @colors = Color.all
    end

    def new
    end

    def show
        @color = Color.find_by(id: params[:id])
    end

    def edit
    end
end
