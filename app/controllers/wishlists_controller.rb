class WishlistsController < ApplicationController
  before_filter :authorize
  
  def index
    @user = User.find_by(id: params[:user_id])
    @user_wishlists = @user.wishlists
  end

  def new
  end

  def create
  end

  def show
    @wishlist = Wishlist.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end
  
end
