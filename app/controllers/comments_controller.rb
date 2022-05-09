class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    comment = Comment.create(comment_params)
    redirect_to "/articles/#{comment.article.id}"
  end

  def destroy
    # article = Article.find(params[:article_id])
    # article.comments(params[:id]).destroy
    comment = Comment.find_by(id: params[:id], article_id: params[:article_id])
    comment.destroy
    redirect_to "/articles/#{comment.article.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
