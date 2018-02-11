class WishlistsController < ApplicationController
  before_filter :authorize
  
  def index
    @user = User.find_by(id: params[:user_id])
    @user_wishlists = @user.wishlists
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @wishlist = Wishlist.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.user
    if @wishlist.save
      redirect_to user_wishlist_path(@user, @wishlist)
    else
      render 'new'
    end
  end

  def show
    @wishlist = Wishlist.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @wishlist = Wishlist.find_by(id: params[:id])
  end

  def update
  end
  
  private

  def wishlist_params
    params.require(:wishlist).permit(:name, :user_id)
  end
end
