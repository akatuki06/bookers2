class BookersController < ApplicationController
before_action :authenticate_user!
  
  def index
      # @user = User.find(params[:id])
  	  @post = Booker.new
  	  @posts = Booker.all
      # @posts = @user.posts.page(params[:page]) 
  end

  def show
      @post = Booker.new
      @posted = Booker.find(params[:id])
  end

  def new
  	  @post = Booker.new
  end

  def create
  	  @post = Booker.new(post_params)
      # post.子のid(投稿id)  =  親(ログインしている人)のid←つまり紐付け
      @post.user_id = current_user.id
  	  if @post.save
  	  redirect_to user_path(current_user)
      else
        @posts = Booker.all
        render :index
      end
  end

  def edit
  	  @posted = Booker.find(params[:id])

      if @posted.user != current_user
          redirect_to user_path(current_user)
      end

  end

  def update
  	  book = Booker.find(params[:id])
  	  book.update(post_params)
  	  redirect_to booker_path
  end

  def destroy
  	  book = Booker.find(params[:id])
  	  book.destroy
  	  redirect_to bookers_path
  end

  private
  	def post_params
  	  params.require(:booker).permit(:title, :body)
  	end

end
