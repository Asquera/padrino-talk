EurucampTutorial.controller do
  get :index do
    @posts = Post.all
    render 'posts/index'
  end
  
  get :post, :with => :id do
    @post = Post.get(params[:id])
    render 'posts/show'
  end
end