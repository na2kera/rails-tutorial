class CommentsController < ApplicationController
    # コメントの削除を認証済みのユーザーだけもする
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    def create
        # 先に該当する記事をさがす
        @article = Article.find(params[:article_id])
        # createメソッドを使用することで作成と保存を同時に行う
        @comment = @article.comments.create(comment_params)
        # 元の記事に戻る
        redirect_to article_path(@article)
    end

    # コメント削除用のボタン
    def destroy
      # 対象の記事をさがす
      @article = Article.find(params[:article_id])
      # 対象のコメントをさがす
      @comment = @article.comments.find(params[:id])
      # 記事を削除
      @comment.destroy
      redirect_to article_path(@article), status: :see_other
    end
    
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body, :status)
        end
end
