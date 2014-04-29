class PostsController < ApplicationController

  def new
    @post = current_user.posts.new

  end

  def create
    @post = current_user.posts.new(post_params)

    @post.links.new(link_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:body, :author_id)
  end

  def link_params
    params.permit(:link => [:title, :url]).require(:link).values
    .reject { |link| link.values.any?(&:blank?) }
  end



end
