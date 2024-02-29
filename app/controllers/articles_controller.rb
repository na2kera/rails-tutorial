class ArticlesController < ApplicationController
  def index
    # @で始まる変数はビューからでも参照できる
    @articles = Article.all
  end

  # :idをroute.rbに書いたのでパラメータとして受け取る
  # showアクションはデフォルトでapp/views/articles/show.html.erbをレンダリングします。
  def show
    @article = Article.find(params[:id])
  end
end
