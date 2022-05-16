class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    favorites = Favorite.where(user_id:current_user.id).pluck(:article_id)
    @favorite_articles = Article.find(favorites)
  end
end
