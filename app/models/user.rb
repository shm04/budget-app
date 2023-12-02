class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :entities, foreign_key: :author_id, dependent: :destroy

  has_many :groups, foreign_key: :user_id, dependent: :destroy
end
