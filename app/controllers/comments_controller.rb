class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy	
  before_action :set_micropost, only: [:index, :new, :create]
  def create
  	@comment = @micropost.comments.build(comment_params) do |c|
      c.user = current_user
    end
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end  
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :picture)
  end

  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

  def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end