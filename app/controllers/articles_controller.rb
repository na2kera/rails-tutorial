class ArticlesController < ApplicationController
  def index
    # @で始まる変数はビューからでも参照できる
    @articles = Article.all
  end
end
