class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    image_name: "default_icon-9263fc59c414b7228d256fc178dcb22183561357950a68f5ad086ba7ee054974.jpg"
                    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録しました"
      redirect_to("/")
    else 
      flash[:notice] = "未入力があります"
      render("/users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.update(email: params[:email], password: params[:password])
      redirect_to("/users/account")
      flash[:notice] = "ユーザー情報を編集しました"
    else
      flash[:notice] = "未入力があります"
      render("users/edit")
    end
  end

  def profile
  end

  def update_2
    @user = User.find_by(id: session[:user_id])
    @user.update(name: params[:name], introduction: params[:introduction])

    if params[:image]
      @user.image_name = "#{@current_user.id}.jpg"
      image = params[:image]
      File.binwrite("public/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/profile")
    else
      flash.now[:notice] = "未入力があります"
      render("users/profile")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user 
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレス又はパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def account
  end

  def reserve_index
    @reserves = Reserve.where(user_id: @current_user.id)
  end

end
