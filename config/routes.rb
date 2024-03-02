Rails.application.routes.draw do
  # rootルーティングがArticlesControllerのindexアクションに対応付けられた
  root "articles#index"

  # ルーティングは、GET /articlesリクエストをArticlesControllerのindexアクションに対応付けます。
  # get "/articles", to: "articles#index"
   # get "/articles/:id", to: "articles#show"
  
  # getで書いていたルーティングをresourcesで書き換え
  resources  :articles do
    # commentsの参照のためのルーティング
    resources :comments
  end
end
