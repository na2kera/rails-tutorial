# 重複しているロジックをここに書く
module Visible
    # ActiveSupport::Concernでバリデーw四をシンプルにかく
    extend ActiveSupport::Concern

    VALID_STATUSES = ['public', 'private', 'archived']

    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end

    # クラスメソッドの追加
    class_methods do
        def public_count
          where(status: 'public').count
        end
    end

    def archived?
      status == 'archived'
    end
  end