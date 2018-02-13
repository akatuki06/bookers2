class BookersController < ApplicationController
  def index
  	  @post = Booker.new
  	  @posts = Booker.all
  end

  def show
  	  @post = Booker.find(params[:id])
  end

  def new
  	  @post = Booker.new
  end

  def create
  	  post = Booker.new(post_params)
  	  post.save
  	  redirect_to bookers_path
  end

  def edit
  	  @post = Booker.find(params[:id])
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
