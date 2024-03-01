# コメントモデル

# Articleモデルと似ている。違いは、Active Recordの関連付け（アソシエーション: association）を設定するbelongs_to :articleという行がある点です。
class Comment < ApplicationRecord
  belongs_to :article
end
