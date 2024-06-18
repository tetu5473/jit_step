class Article < ApplicationRecord
  has_one_attached :image

  # 必要に応じて以下のバリデーションを追加
  validates :title, presence: true  # タイトルのバリデーション
  validates :content, presence: true  # content のバリデーションを追加
end
