class Article < ApplicationRecord
    # visibleをインクルード
    include Visible

    # コメントと記事を関連づけるためにdependentオプションを指定
    has_many :comments, dependent: :destroy

    # バリデーションチェック。入力された値が適切か判定
    # タイトル入力必須
    validates :title, presence: true
    # body入力必須、十文字以上
    validates :body, presence: true, length: { minimum: 10 }

    
end
