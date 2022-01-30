class PostsController < ApplicationController
  
  before_action :set_q, only: [:index, :search]

  def index
    @posts = Post.all
  end

  def index_tokyo
    @posts = Post.where('place LIKE ?', "%東京%")
  end

  def index_oosaka
    @posts = Post.where('place LIKE ?', "%大阪%")
  end

  def index_kyoto
    @posts = Post.where('place LIKE ?', "京都%")
  end

  def index_sapporo
    @posts = Post.where('place LIKE ?', "%札幌%")
  end

  def new 
    @post = Post.new()
  end

  def create
    @post = Post.new(room_name: params[:room_name],
                    room_introduction: params[:room_introduction],
                    price: params[:price],
                    place: params[:place],
                    room_image: "/room01.jpg",
                    user_id: @current_user.id)
    if@post.save
      flash[:notice] = "ルーム登録しました"
      redirect_to("/")  
    else 
      flash[:notice] = "未入力があります"
      render("posts/new")
    end 
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def register
    @posts = Post.where(user_id: @current_user.id)
  end

  def update
    @post = Post.find_by(id: params[:id])
    if params[:image]
      @post.room_image = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_image/#{@post.room_image}", image.read)
    end

    if @post.save
      flash[:notice] = "ルーム写真を登録しました"
      redirect_to("/posts/#{@post.id}")
    else
      flash[:notice] = "未入力があります"
      render("posts/edit")
    end

  end

  def search
    @results = @q.result
    @post = Post.find_by(id: params[:id]) 
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
  end

  private
  def post_params
    params.require(:post).permit(:room_name)
  end
 
end
