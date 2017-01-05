class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :create, :destroy, :update]

    def create
        @article = Article.find(params[:article_id])
        @comment = Comment.new(comment_params)
        @comment.article = @article 
        @comment.user = @current_user
        if @comment.save
            redirect_to @article, notice: 'Comment was successfully created.'
        else 
            redirect_to @article, alert: 'Error creating comment.'
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        respond_to do |format|
            format.html { redirect_to @article, notice: 'Article was successfully destroyed.' }
        end
    end

    private

    def comment_params
        params.permit(:body)
    end
end
