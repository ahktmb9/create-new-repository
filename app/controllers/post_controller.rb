class PostController < ApplicationController
  def index
    @posts=Post.all.order(created_at: :desc)
  end
  def new
    @post=Post.new
  end
  def show
    @post=Post.find_by(id: params[:id])
  end
  def create
    @post=Post.new(content: params[:content])
    if
    @post.save
    flash[:notice]="投稿を作成しました"
    redirect_to("/post/index")
  else
    render("/post/new")
  end
  end
  def edit
    @post=Post.find_by(id: params[:id])
  end
  def update
    @post=Post.find_by(id: params[:id])
    @post.content=params[:content]

    if
      @post.save
      flash[:notice]="投稿を編集しました"
      redirect_to("/post/index")
    else
      render("/post/edit")
    end

  end
  def destroy
    @post=Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="投稿を削除しました"
    redirect_to("/post/index")
  end

end
