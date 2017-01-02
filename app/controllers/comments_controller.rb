class CommentsController < ApplicationController

    def create
        @article = Article.find(params[:article_id])
        if @article.comments.create(comment_params)
            redirect_to @article, notice: 'Comment was successfully created.'
        else 
            redirect_to @article, alert: 'Error creating comment.'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:author, :body)
    end
end
