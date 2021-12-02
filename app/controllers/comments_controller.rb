class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def index
        @comments = Comment.all
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.save
        render json: @comment
    end

    def show
        @article = Comment.find_by_id(params[:id])
    end

    def destroy
        @comment = Comment.find_by_id(params[:id])
        @comment.destroy
        render json: @comment
    end



    private
    def comment_params
        params.require(:comment).permit(:text, :user_id, :pin_id)
    end
end
