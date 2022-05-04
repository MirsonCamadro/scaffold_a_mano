class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    http_basic_authenticate_with name: "mirson", password: "123123", except: :index

    def index 
        @q = Post.ransack(params[:q])
        @posts = @q.result(distinct: true).page(params[:page]).per(6)
    end

    def show 
    end

    def new 
        @post = Post.new
    end

    def edit 
    end

    def create 
        @post = Post.create(posts_params)

        respond_to do |format|
            if @post.save 
                format.html { redirect_to post_path(@post), notice: "Se creo tu post"}
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def update 
        respond_to do |format|
            if @post.update(posts_params)
                format.html { redirect_to post_path(@post), notice: "Se creo tu post"}
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
        
    end

    def destroy 
        @post.destroy

        respond_to do |format|
            format.html { redirect_to root_path, alert: "tu post fue borrado" }
        end
    end

    def api_post
        @posts = Post.all 
        render json: @posts
    end


    private 

    def set_post
        @post = Post.find(params[:id])
    end

    def posts_params 
        params.require(:post).permit(:title, :description, :image_url, :author, :status)
    end


end
