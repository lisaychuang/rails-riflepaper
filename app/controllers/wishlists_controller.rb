require 'pry'

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
    @wishlist.user = @user
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
    @wishlist = Wishlist.find_by(id: params[:id])
    @user = User.find_by_id(@wishlist.user_id)
  end

  def update
    @wishlist = Wishlist.find_by(id: params[:id])
    @user = User.find_by_id(@wishlist.user_id)
      if @wishlist.update(wishlist_params)
        redirect_to user_wishlist_path(@user, @wishlist)
      else
          redirect_to edit_user_wishlist_path(@user, @wishlist)
      end
  end
  
  private

  def wishlist_params
    params.require(:wishlist).permit(:name, :notes, :budget)
  end
end
