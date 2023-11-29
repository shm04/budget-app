class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :entities, foreign_key: :author_id, dependent: :destroy
  
  has_many :user_groups
  has_many :groups, through: :user_groups, class_name: 'UserGroup'
end
