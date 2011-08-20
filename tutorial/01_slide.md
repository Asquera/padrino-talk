!SLIDE

# Quick Tutorial

!SLIDE

# Initial setup

!SLIDE commandline incremental

    $ padrino gen project eurucamp \
        --adapter=sqlite \
        --orm=datamapper \
        --test=rspec \
        --mock=mocha \
        --script=jquery \
        --renderer=erb \
        --stylesheet=less \
        --bundle
    $ cd eurucamp-tutorial
    $ bundle install

!SLIDE commandline incremental
    
    $ padrino rake gen
    $ padrino gen model posts title:string content:text
    $ padrino gen admin
    $ padrino gen admin_page posts
    
!SLIDE center

# Some initial mapping

!SLIDE center

# apps.rb

!SLIDE 

    @@@ruby
    Padrino.mount("EurucampTutorial").to('/')
    Padrino.mount("Admin").to("/admin")
    
!SLIDE

    @@@ruby
    Padrino.mount("EurucampTutorial").to('/blog')
    Padrino.mount("Admin").to("/admin")

!SLIDE

# (Almost) No implicit startup!

!SLIDE

# Code loading and reloading happens automatically

!SLIDE

# Our first controller

!SLIDE

    @@@ruby
    # app/controllers/posts.rb
    EurucampTutorial.controller :posts do
      get :index do
        @posts = Post.all
        render 'posts/index'
      end
      
      get :show, :with => :id do
        @post = Post.get(params[:id])
        render 'posts/show'
      end
    end
    
!SLIDE
    Application: EurucampTutorial
        URL                 REQUEST  PATH
        (:posts, :index)      GET    /blog/posts
        (:posts, :show)       GET    /blog/posts/show/:id
        
!SLIDE

    @@@ruby
    # app/controllers/posts.rb
    EurucampTutorial.controller :posts => "/" do
      get :index do
        @posts = Post.all
        render 'posts/index'
      end

      get :show, :with => :id do
        @post = Post.get(params[:id])
        render 'posts/show'
      end
    end

!SLIDE
   
    Application: EurucampTutorial
        URL         REQUEST  PATH
        (:index)      GET    /blog/
        (:show)       GET    /blog/show/:id
        
!SLIDE

    @@@ruby
    # app/controllers/posts.rb
    EurucampTutorial.controller :posts => "/" do
      get :index do
        @posts = Post.all
        render 'posts/index'
      end
      
      get :show, :map => ":id" do
        @post = Post.get(params[:id])
        render 'posts/show'
      end
    end
    
    