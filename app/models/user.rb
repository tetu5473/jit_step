class User < ApplicationRecord
  # Deviseのモジュール追加
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true
end
