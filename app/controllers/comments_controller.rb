class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update, :destroy]    
    
    def create
        @post = Post.find(params[:post_id])
        
        if (@post.comments.create(comment_params))
            redirect_to @post, 
                notice: "Comment was created"
        else
            redirect_to @post,
                alert: "Error Creating Post"
        end
    end
    

    # DELETE /comment/1
    # DELETE /comment/1.json
    def destroy
        @comment.destroy
        respond_to do |format|
            format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
  
    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:author, :body, :email)
    end
    
end
