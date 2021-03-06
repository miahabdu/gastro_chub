class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
    @featured = Post.featured.order('created_at DESC')
    @post_pages = Post.order('created_at DESC').page(params[:page]).per(5)
    @page_category = nil
  end

  def food
    @posts = Post.order('created_at DESC')
    @featured = Post.featured.order('created_at DESC')
    @post_pages = Kaminari.paginate_array(Post.where(category: 'Food').order('created_at DESC')).page(params[:page]).per(15)
    @page_category = "Food"
  end

  def drinks
    @posts = Post.order('created_at DESC')
    @featured = Post.featured.order('created_at DESC')
    @post_pages = Kaminari.paginate_array(Post.where(category: 'Drinks').order('created_at DESC')).page(params[:page]).per(15)
    @page_category = "Drinks"
  end

  def travel
    @page_category = "Travel"
    @featured = Post.featured.order('created_at DESC')
    @posts = Post.order('created_at DESC')
    @post_pages = Kaminari.paginate_array(Post.where(category: 'Travel').order('created_at DESC')).page(params[:page]).per(15)
  end

  def tags
    @page_category = "##{params[:tag]}"
    @featured = Post.featured.order('created_at DESC')
    @posts = Post.order('created_at DESC')
    @post_pages = Kaminari.paginate_array(Post.tagged_with(params[:tag]).order('created_at DESC')).page(params[:page]).per(15)
  end

  def search
    @page_category = "Search results for: #{params[:query]}"
    @featured = Post.featured.order('created_at DESC')
    @posts = Post.order('created_at DESC')
    @post_pages = Kaminari.paginate_array(Post.text_search(params[:query]).order('created_at DESC')).page(params[:page]).per(15)
  end
end
