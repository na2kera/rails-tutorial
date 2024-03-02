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

  # CURD操作のupdateの部分のアクション
  # editとupdateは上のnewやcreate似ている
  # データベースから記事を所得して@articleに保存
  def edit
    @article = Article.find(params[:id])
  end

  # データベースから記事を所得してバリデーションチェックが成功した時に記事ページにリダイレクト
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # データベースから記事を所得してdestroyメソッドで削除
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

  # rootパスにリダイレクトする
    redirect_to root_path, status: :see_other
  end

  # paramsをフィルタ（強く型付け）する
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
