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

  # 新しい記事を一件インスタンス化する。データベースには保存しない
  def new
    @article = Article.new
  end

  # 新しい記事を一件インスタンス化した後、データベースへの保存を試みる
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # paramsをフィルタ（強く型付け）する
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
