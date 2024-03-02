class CommentsController < ApplicationController
    def create
        # 先に該当する記事をさがす
        @article = Article.find(params[:article_id])
        # createメソッドを使用することで作成と保存を同時に行う
        @comment = @article.comments.create(comment_params)
        # 元の記事に戻る
        redirect_to article_path(@article)
      end
    
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body, :status)
        end
end
