class PostsController < ApplicationController
  def index
    if params[:search]
      @posts = posts.search(search_tokens) # change this to search after implementing it
    else
      @posts = posts.where(domain: params[:domain])
    end
  end

  def show
    @post = Post.find_by(domain: params[:domain], slug: params[:slug])
  end

  private

  def search_tokens
    params[:search].split(' ')
  end

  def posts
    Post.includes(:authors)
  end
end
