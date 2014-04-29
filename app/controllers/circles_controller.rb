class CirclesController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      # @circles = Circle.where(user_id: params[:user_id])
      @circles = @user.circles
    else
      @circles = Circle.all
    end
  end

  def show
    @circle = Circle.find(params[:id])
  end

  def new
    @circle = Circle.new
    @users = User.select{ |user| user.id != current_user.id }
  end

  def create
    @circle = current_user.circles.new(circle_params)

    if @circle.try(:save)
      redirect_to user_circles_url(current_user)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end
  end

  def edit
    @circle = Circle.find(params[:id])
    @users = User.select{ |user| user.id != current_user.id }
  end

  def update
    @circle = Circle.find(params[:id])

    if @circle.update_attributes(circle_params)
      redirect_to user_circles_url(current_user)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render :new
    end


  end

  private

  def circle_params
    params.require(:circle).permit(:user_id, :name, friend_ids: [])
  end

end
