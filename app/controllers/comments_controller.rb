class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :create, :destroy, :update]

    def create
        @article = Article.find(params[:article_id])
        @comment = Comment.new(comment_params)
        @comment.article = @article 
        @comment.user = @current_user
        #my_params[:article_id] = @article.id
        #if @article.comments.create(comment_params)
        if @comment.save
            redirect_to @article, notice: 'Comment was successfully created.'
        else 
            redirect_to @article, alert: 'Error creating comment.'
        end
    end

    private

    def comment_params
        #params.require(:comment).permit(:body)
        params.permit(:body)
    end
end
