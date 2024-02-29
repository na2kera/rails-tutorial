class Article < ApplicationRecord
    # バリデーションチェック。入力された値が適切か判定
    # タイトル入力必須
    validates :title, presence: true
    # body入力必須、十文字以上
    validates :body, presence: true, length: { minimum: 10 }
end
