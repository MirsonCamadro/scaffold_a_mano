class PostsController < ApplicationController

    def index 
        @posts = Post.all
    end

    def show 
        @post = Post.find(params[:id])
    end

    def new 
        @post = Post.new
    end

    def edit 
        @post = Post.find(params[:id])
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
        @post = Post.find(params[:id])

        respond_to do |format|
            if @post.update(posts_params)
                format.html { redirect_to post_path(@post), notice: "Se creo tu post"}
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
        
    end

    def destroy 
        @post = Post.find(params[:id])
        @post.destroy

        respond_to do |format|
            format.html { redirect_to root_path, alert: "tu post fue borrado" }
        end
    end


    private 

    def posts_params 
        params.require(:post).permit(:title, :description, :image_url)
    end


end
