
class PostsController < ApplicationController
     before_filter :authenticate_user!, only: [:new, :create]

def new
    @post = Post.new
end

def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save!
        redirect_to @post
    else 
        render :new
    end
end

def update
    @posts = post.find params[:id]
    @posts.update post_params
    if @posts.save!
        redirect_to @post
    else 
        render :edit 
    end 
end

def show
    @post = Post.find params[:id]
    @comment = Comment.new
end

def edit
    posts = Post.find params[:id]
end

def update
    respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        else
            format.html { render :edit }
        end
    end
end
def add_comment
    @post = Post.find params[:id]
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @post
end
    private
    
    def post_params
        params.require(:post).permit(:title,:body, :published)
        
    end
    def comment_params
        params.require(:comment).permit(:body)
    end

end