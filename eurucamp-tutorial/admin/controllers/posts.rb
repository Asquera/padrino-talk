Admin.controllers :posts do

  get :index do
    @posts = Posts.all
    render 'posts/index'
  end

  get :new do
    @posts = Posts.new
    render 'posts/new'
  end

  post :create do
    @posts = Posts.new(params[:posts])
    if @posts.save
      flash[:notice] = 'Posts was successfully created.'
      redirect url(:posts, :edit, :id => @posts.id)
    else
      render 'posts/new'
    end
  end

  get :edit, :with => :id do
    @posts = Posts.get(params[:id])
    render 'posts/edit'
  end

  put :update, :with => :id do
    @posts = Posts.get(params[:id])
    if @posts.update(params[:posts])
      flash[:notice] = 'Posts was successfully updated.'
      redirect url(:posts, :edit, :id => @posts.id)
    else
      render 'posts/edit'
    end
  end

  delete :destroy, :with => :id do
    posts = Posts.get(params[:id])
    if posts.destroy
      flash[:notice] = 'Posts was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Posts!'
    end
    redirect url(:posts, :index)
  end
end